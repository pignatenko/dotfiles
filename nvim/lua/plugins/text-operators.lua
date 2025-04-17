return {
	{
		"echasnovski/mini.operators",
		version = "*",
		opts = {
			exchange = {
				prefix = "gs",
			},
			sort = {
				prefix = "gS",
			},
		},
		keys = {
			{ "g=", desc = "Evaluate text and replace with output" },
			{ "gs", desc = "Swap text regions" },
			{ "gm", desc = "Duplicate/multiply text regions" },
			{ "gr", desc = "Replace text region with register" },
			{ "gs", desc = "Sort text region" },
		},
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		opts = {
			exchange = {
				prefix = "gs",
			},
			sort = {
				prefix = "gS",
			},
		},
		keys = {
			{ "sa", desc = "Add surrounding" },
			{ "sd", desc = "Delete surrounding" },
			{ "sf", desc = "Find surrounding to right" },
			{ "sF", desc = "Find surrounding to left" },
			{ "sh", desc = "Highlight surrounding" },
			{ "sr", desc = "Replace surrounding" },
			{ "sn", desc = "Update n lines" },
		},
	},
	{
		"echasnovski/mini.ai",
		version = "*",
		opts = function()
			local ai = require("mini.ai")
			return {
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					p = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }), -- function
					r = ai.gen_spec.treesitter({ a = "@return.outer", i = "@return.inner" }), -- function
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
				},
			}
		end,
	},
	{
		"echasnovski/mini.comment",
		version = "*",
	},
	{
		"ggandor/leap.nvim",
		keys = {
			{ "t", "<Plug>(leap)", desc = "Leap" },
			{ "T", "<Plug>(leap_anywhere)", desc = "Leap" },
		},
	},
}
