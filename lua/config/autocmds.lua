-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Kanagawa Dragon: readable inline git blame
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
  fg = "#7E9CD8", -- dragonBlue
  italic = true,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "mdx" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.foldmethod = "manual"
  end,
})
