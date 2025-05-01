return {
  run = function()
    local opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = "default",
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_and_accept()
            elseif cmp.snippet_active() then
              return cmp.snippet_forward()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<C-j>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_and_accept()
            elseif cmp.snippet_active() then
              return cmp.snippet_forward()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<C-k>"] = { "snippet_backward", "fallback" },
        ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
        ["<C-BS>"] = { "hide", "fallback" },
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = "cmdline",
          ["<C-e>"] = {},
          ["<C-<BS>>"] = { "cancel" },
        },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      completion = {
        menu = {
          auto_show = false,
        },
        documentation = { treesitter_highlighting = true, auto_show = true },
      },
      -- signature = { window = { treesitter_highlighting = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          -- Remove language keywords from lists
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return item.kind ~= require("blink.cmp.types").CompletionItemKind.Keyword
              end, items)
            end,
          },
          path = {},
        },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    }

    require("blink.cmp").setup(opts)

    local delay_ms = 1000
    local timer = vim.uv.new_timer()
    vim.api.nvim_create_autocmd({ "CursorMovedI", "TextChangedI" }, {
      callback = function()
        timer:stop()
        timer:start(delay_ms or 1000, 0, function()
          timer:stop()
          vim.schedule(function()
            -- Only run in insert mode.
            if vim.api.nvim_get_mode()["mode"] == "i" then
              local blinkcmp = require("blink.cmp")
              -- Only show if not already open
              if blinkcmp.is_visible() == false then
                require("blink.cmp").show()
              end
            end
          end)
        end)
      end,
    })
  end,
}
