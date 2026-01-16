return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" }, -- lazy-load only when used
    keys = {
      { "<leader>gw", "<cmd>Git blame<cr>", desc = "Git blame (Fugitive)" },
    },
  },
}
