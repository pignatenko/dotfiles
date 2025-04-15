local SETTINGS = {
	GLOBAL = "GLOBAL",
	WINDOW = "WINDOW",
	BUFFER = "BUFFER",
}

local SETTINGS_FILES = {
	GLOBAL = "settings/default_global",
	WINDOW = "settings/default_window",
	BUFFER = "settings/default_buffer",
}

local function getBuf(buf)
	if buf ~= nil then
		return buf
	end

	return 0
end

local function createDefaultFileTypeConfig(filetype)
	local filePath = vim.fn.expand(string.format("$HOME/.config/nvim/after/ftplugin/%s.lua", filetype))
	local file = io.open(filePath, "w")
	if file == nil then
		vim.print(string.format("Could not open %s for writing"), filePath)
		return
	end

	file:write([[
local settings = require("lib/settings")
settings.apply(settings.WINDOW)
settings.apply(settings.BUFFER)
  ]])
	file:close()
end

local function hasFtPluginFile(filetype)
	local directoryGlob = string.format("%s/**/*.lua", filetype)
	local fileGlob = string.format("%s*.lua", filetype)
	local directoryPath = vim.fn.globpath(vim.fn.expand("$HOME/.config/nvim/after/ftplugin/"), directoryGlob)
	local filePath = vim.fn.globpath(vim.fn.expand("$HOME/.config/nvim/after/ftplugin/"), fileGlob)

	if directoryPath == "" and filePath == "" then
		return false
	else
		return true
	end
end

local function apply(type, bufnr)
	local file = SETTINGS_FILES[type]
	if file == nil then
		vim.print("Could not find settings for ", type)
	end

	local settingsModule = require(file)
	settingsModule.settings(getBuf(bufnr))
end

local function createFtDetectFallback()
	local windowAugroup = vim.api.nvim_create_augroup("FTDetectFallback", {})

	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		group = windowAugroup,
		callback = function(data)
			local buf = data.buf
			local filetype = vim.bo[buf].ft

			if vim.b[buf].has_ft_plugin_file == nil then
				vim.b[buf].has_ft_plugin_file = hasFtPluginFile(filetype)
			end

			if vim.b[buf].has_ft_plugin_file == false then
				apply(SETTINGS.WINDOW, buf)
				apply(SETTINGS.BUFFER, buf)
				vim.schedule(function()
					createDefaultFileTypeConfig(filetype)
					vim.b[buf].has_ft_plugin_file = true
				end)
			end
		end,
	})
end

return {
	apply = apply,
	SETTINGS = SETTINGS,
	GLOBAL = "GLOBAL",
	WINDOW = "WINDOW",
	BUFFER = "BUFFER",
	createFtDetectFallback = createFtDetectFallback,
}
