return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      notify_no_formatters = false,

      -- Pick formatters per filetype
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        markdown = { "prettier" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        rust = { "rustfmt" },
        toml = { "taplo" },
      },

      -- Format-on-save (controlled)
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback", -- if no formatter configured, fall back to LSP formatting
      },
    },
  },
}
