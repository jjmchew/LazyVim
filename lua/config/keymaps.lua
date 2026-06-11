-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del({ "v" }, "<A-j>")
vim.keymap.del({ "v" }, "<A-k>")
vim.keymap.set("n", "<leader>gl", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle Git blame (inline)" })
vim.keymap.set("n", "<leader>gD", "<cmd>Gitsigns toggle_deleted<cr>", {
  desc = "Toggle Deleted Lines",
})
vim.keymap.set("n", "<leader>gm", "<cmd>Gitsigns change_base main<cr>", { desc = "Gitsigns: change base to main" })
