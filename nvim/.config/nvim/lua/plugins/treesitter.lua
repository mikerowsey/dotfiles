return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		cmd = { "TSInstall", "TSUpdate", "TSUpdateSync" },
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"c",
					"cpp",
					"lua",
					"python",
					"bash",
					"json",
					"yaml",
					"toml",
					"rust",
					"markdown",
					"markdown_inline",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
				},
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
}

