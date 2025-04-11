plugin = {
	"junegunn/vim-easy-align",
	keys = {
		{
			"<Enter>",
			"<Plug>(EasyAlign)",
			mode = { "v" },
			remap = false,
			desc = "Easy Align Visual Mode",
		},
		{ "<leader>a", "<Plug>(EasyAlign)", remap = false, desc = "Easy Align Motion" },
	},
}

return plugin
