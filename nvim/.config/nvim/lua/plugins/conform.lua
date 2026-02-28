return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      -- Pick formatters per filetype
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        -- add later: python = { "black" }, etc.
      },

      -- Format-on-save (controlled)
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true, -- if no formatter configured, fall back to LSP formatting
      },
    },
  },
}
