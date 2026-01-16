-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- added by me to disable autocompletion suggestions (most are gone)
vim.opt.foldmethod = "marker"
vim.keymap.set("n", "<leader>tr", "<cmd>set rnu!<CR>", { desc = "toggle [r]elative numbers" })
require("cmp").setup({ enabled = false })
