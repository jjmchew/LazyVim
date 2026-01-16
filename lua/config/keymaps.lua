-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del({ "v" }, "<A-j>")
vim.keymap.del({ "v" }, "<A-k>")
vim.keymap.set("n", "<leader>gl", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle Git blame (inline)" })
