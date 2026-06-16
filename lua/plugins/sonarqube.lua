-- ~/.config/nvim/lua/plugins/sonarqube.lua
return {
  {
    "iamkarasik/sonarqube.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      rules = {
        enabled = true,

        ["typescript:S106"] = { enabled = true },
        ["javascript:S106"] = { enabled = true },
        ["typescript:S1764"] = { enabled = true },
        ["javascript:S1764"] = { enabled = true },
        ["typescript:S2068"] = { enabled = true },
        ["javascript:S2068"] = { enabled = true },

        ["python:S106"] = { enabled = true },
        ["python:S1481"] = { enabled = true },
      },
    },
  },
}
