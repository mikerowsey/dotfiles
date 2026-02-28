local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local sys = vim.uv.os_uname().sysname
local lockfile = vim.fn.stdpath("config") .. "lazy-lock." .. sys .. ".json"

require("lazy").setup("plugins", {
    lockfile = lockfile,
    change_detection = { notify = false },
})

