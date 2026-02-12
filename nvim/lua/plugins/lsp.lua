return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "lua", "vim", "vimdoc",
          "c", "cpp",
          "python",
          "rust",
          "bash",
          "json", "yaml", "toml",
          "markdown", "markdown_inline",
        },
      })
    end,
  },
}

