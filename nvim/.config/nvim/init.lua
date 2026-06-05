-- Leader
vim.g.mapleader = " "

-- Options
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"
-- Keymaps
local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear Search" })

map("n", "<leader>e", "<cmd>Ex<CR>", { desc = "Explorer" })

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({

    {
        "nvim-lua/plenary.nvim",
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")

            map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
            map("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
            map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
            map("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },

    {
        "folke/which-key.nvim",
        config = true,
    },

})

