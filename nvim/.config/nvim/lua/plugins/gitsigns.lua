return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			current_line_blame = false, -- toggle with keymap below
			current_line_blame_opts = {
				delay = 300,
			},
		},
	},
}
