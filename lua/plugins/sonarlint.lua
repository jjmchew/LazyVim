-- ~/.config/nvim/lua/plugins/sonarlint.lua
return {
  {
    "obarbier/sonarlint.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "lewis6991/gitsigns.nvim",
    },
    config = function()
      local mason = vim.fn.expand("$MASON/share/sonarlint-analyzers/")

      local candidates = {
        mason .. "sonarjs.jar",
        mason .. "sonarpython.jar",
        mason .. "sonarcfamily.jar",
        -- add this back only if you already use nvim-jdtls:
        -- mason .. "sonarjava.jar",
      }

      local analyzers = {}
      for _, path in ipairs(candidates) do
        if vim.loop.fs_stat(path) then
          table.insert(analyzers, path)
        end
      end

      require("sonarlint").setup({
        filetypes = {
          "javascript",
          "typescript",
          "typescriptreact",
          "javascriptreact",
          "python",
          "c",
          "cpp",
          -- add "java" only if nvim-jdtls is installed/configured
        },
        server = {
          cmd = vim.list_extend({
            "sonarlint-language-server",
            "-stdio",
            "-analyzers",
          }, analyzers),
        },
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "sonarlint-language-server") then
        table.insert(opts.ensure_installed, "sonarlint-language-server")
      end
    end,
  },
}
