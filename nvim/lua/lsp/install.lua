command = {}

function getEnvLogLevel()
  local logLevelEnv = os.getenv("NVIM_LSP_LOG_LEVEL");
  if logLevelEnv == "OFF" or logLevelEnv == "off" then
    return "OFF"
  end

  if logLevelEnv == "ERROR" or logLevelEnv == "error" then
    return "ERROR"
  end


  if logLevelEnv == "WARN" or logLevelEnv == "warn" then
    return "WARN"
  end

  if logLevelEnv == "INFO" or logLevelEnv == "info" then
    return "INFO"
  end

  if logLevelEnv == "DEBUG" or logLevelEnv == "debug" then
    return "DEBUG"
  end

  if logLevelEnv == "TRACE" or logLevelEnv == "trace" then
    return "TRACE"
  end

  return "WARN"
end

function command.run()
	vim.lsp.set_log_level(getEnvLogLevel());
	vim.api.nvim_create_user_command("NxInit", function()
		-- print("Running nx init...")
		local now = tostring(os.time())
		local fileName = string.format("%s_graph.json", now)
		local cmd = string.format("npx nx graph --file=%s", fileName)

		local function handle_response(_, code)
			-- read the file into memory
			local projectGraphFile = io.open(fileName, "r")
			if projectGraphFile then
				-- read project graph from file
				local projectGraph = vim.json.decode(projectGraphFile:read("*a"))
				projectGraphFile:close()

				-- remove the graph file
				os.remove(fileName)

				-- get typescript-tools lsp client
				local lspClients = vim.lsp.get_active_clients()
				local tsclient
				for _, client in ipairs(lspClients) do
					if client.name == "typescript-tools" then
						tsclient = client
					end
				end
				if not tsclient then
					print("typescript-tools.nvim not active")
					return
				end

				-- get workspace root
				-- always first? alternatives to get absolute workspace root?
				local workspacePath = tsclient.config.workspace_folders[1].name
				if not workspacePath then
					print("Could not figure out workspace path")
					return
				end

				-- create external files for monodon
				local externalFiles = {}
				for _, project in pairs(projectGraph.graph.nodes) do
					local sourceRoot = project.data.sourceRoot

					-- skip the root
					if sourceRoot ~= "." and sourceRoot then
						-- localte the entry file. perhaps use tsconfig.[app|lib].json
						local mainFile
						if
							project.data
							and project.data.targets
							and project.data.targets.build
							and project.data.targets.build.options
							and project.data.targets.build.options.main
						then
							mainFile = workspacePath .. "/" .. project.data.targets.build.options.main
						else
							mainFile = workspacePath .. "/" .. sourceRoot .. "/index.ts"
						end

						-- insert to config
						table.insert(externalFiles, {
							mainFile = mainFile, -- this is not always index.ts!
							directory = workspacePath .. "/" .. sourceRoot,
						})
					end
				end

				-- print(vim.inspect(externalFiles))
				-- send configuration request of monodon plugin to tsserver
				local constants = require("typescript-tools.protocol.constants")
				local method = constants.CustomMethods.ConfigurePlugin
				local args = {
					pluginName = "@monodon/typescript-nx-imports-plugin",
					configuration = {
						externalFiles = externalFiles,
					},
				}
				tsclient.request(method, args, function()
					print("tsserver handled configuration request", method)
				end)
				print("nx plugin initialized!")
			end
		end

		-- call nx deamon with graph request, run it in the background with job
		local job_id = vim.fn.jobstart(cmd, {
			on_exit = handle_response,
			stdout_buffered = true,
			stderr_buffered = true,
		})
	end, {})

	local on_attach = require("lsp/on_attach")


	local diagnostic_config = {
		diagnostic_config = {
			virtual_text = false,
		},
	}

	local eslint = require("efmls-configs.linters.eslint")
	local prettier = require("efmls-configs.formatters.prettier")
	local stylua = require("efmls-configs.formatters.stylua")

	local languages = {
		typescriptreact = { eslint, prettier },
		javascript = { eslint, prettier },
		typescript = { eslint, prettier },
		lua = { stylua },
	}

	local efmls_config = {
		filetypes = vim.tbl_keys(languages),
		settings = {
			rootMarkers = { ".git/" },
			languages = languages,
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
		},
	}

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = { "ts_ls" },
	})
	require("mason-lspconfig").setup_handlers({
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function(server_name) -- default handler (optional)
			require("lspconfig")[server_name].setup({
				on_attach = on_attach,
			})
		end,
		-- Next, you can provide targeted overrides for specific servers.
		-- For example, a handler override for the `rust_analyzer`:
		["ts_ls"] = function()
			require("typescript-tools").setup({
				on_init = function(client, bufnr)
					vim.schedule(function()
						vim.cmd.NxInit()
					end)
				end,
				on_attach = on_attach,
				root_dir = require("lspconfig.util").root_pattern(
					"angular.json",
					"nx.json",
					"project.json",
					"nativescript.config.ts"
				),
				settings = {
					tsserver_plugins = { "@monodon/typescript-nx-imports-plugin" },
					tsserver_file_preferences = {
						importModuleSpecifierPreference = "project-relative",
						includeCompletionsForModuleExports = true,
					},
				},
			})
		end,
		["efm"] = function()
			require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
				on_attach = on_attach,
			}))
		end,
	})
end

return command
