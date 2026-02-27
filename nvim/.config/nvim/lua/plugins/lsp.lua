return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      })

      -- C / C++
      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      -- Python
      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.enable({ "lua_ls", "clangd", "pyright" })
    end,
  },
}
