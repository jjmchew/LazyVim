return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      prettier = {
        command = "node_modules/.bin/prettier",
        cwd = function()
          return vim.fs.root(0, { "package.json", ".git" })
        end,
        require_cwd = true,
      },
    },
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
    },
  },
}
