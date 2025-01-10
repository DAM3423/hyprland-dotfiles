-- Set leader keys
vim.g.mapleader = " "         -- Set the global leader key to space
vim.g.maplocalleader = " "    -- Set the local leader key to space (optional)

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load additional configurations
require("vim-options")        -- Ensure this file exists and is configured
require("lazy").setup("plugins") -- Load plugins using lazy.nvim

