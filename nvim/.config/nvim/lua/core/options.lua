vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "lua", "python", "rust", "bash", "json", "yaml", "toml", "markdown" },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.diagnostic.config({
  virtual_text = false,        -- keep the screen clean; use <leader>e instead
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})
