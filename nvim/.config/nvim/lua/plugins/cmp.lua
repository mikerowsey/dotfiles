return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"windwp/nvim-autopairs",
			-- Optional but useful if you want command-line completion later:
			-- "hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")
			local compare = require("cmp.config.compare")
			local luasnip = require("luasnip")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			require("nvim-autopairs").setup({})
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				-- Keep cmp insert/select mappings here because they are tied to cmp's
				-- popup/menu state and should stay plugin-local.
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = "menu,menuone,noselect",
				},

				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),

					-- Confirm only when you explicitly select something (no surprise accepts)
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = false })
						else
							fallback()
						end
					end),

					-- Tab confirms menu navigation first, then snippet jump, then fallback.
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<Esc>"] = cmp.mapping.abort(),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
				}),

				sorting = {
					priority_weight = 2,
					comparators = {
						compare.offset,
						compare.exact,
						compare.score,
						compare.recently_used,
						compare.kind,
						compare.sort_text,
						compare.length,
						compare.order,
					},
				},

				experimental = {
					ghost_text = true,
				},
			})
		end,
	},
}
