return {
	"stevearc/conform.nvim",

	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },

			c = { "clang_format" },
			cpp = { "clang_format" },

			sh = { "shfmt" },

			markdown = { "prettier" },

			javascript = { "prettier" },
			javascriptreact = { "prettier" },

			typescript = { "prettier" },
			typescriptreact = { "prettier" },

			html = { "prettier" },
			css = { "prettier" },

			json = { "prettier" },
			yaml = { "prettier" },

			markdown = { "prettier" },

			toml = { "taplo" },
		},
	},

	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({
					async = true,
					lsp_format = "never",
				})
			end,
			desc = "Format Code",
		},
	},
}
