return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "graphql",
        "javascript",
        "typescript",
        "tsx",
      },
    },
  },
  {
    "jparise/vim-graphql",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    init = function()
      -- highlight in tagged template literals: gql`...` / graphql`...`
      vim.g.graphql_javascript_tags = { "gql", "graphql" }

      -- If you use Relay-style: graphql`...`
      vim.g.graphql_relay_tags = { "graphql" }
    end,
  },
}
