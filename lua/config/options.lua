-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.foldmethod = "manual"
opt.foldenable = false
opt.foldlevel = 99

vim.g.autoformat = true
vim.g.lazyvim_eslint_auto_format = true
