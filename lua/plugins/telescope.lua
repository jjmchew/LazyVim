return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      -- default toggle state (persisted for the session)
      if vim.g.telescope_live_grep_hidden == nil then
        vim.g.telescope_live_grep_hidden = false
      end

      -- (optional) if you want to ensure ripgrep args exist
      opts.defaults = opts.defaults or {}
      opts.defaults.vimgrep_arguments = opts.defaults.vimgrep_arguments
        or {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        }

      return opts
    end,

    keys = {
      {
        "<leader>th",
        function()
          vim.g.telescope_live_grep_hidden = not vim.g.telescope_live_grep_hidden
          vim.notify(
            "Telescope live_grep hidden: " .. (vim.g.telescope_live_grep_hidden and "ON" or "OFF"),
            vim.log.levels.INFO
          )
        end,
        desc = "Toggle live_grep hidden",
      },

      {
        "<leader>/",
        function()
          local hidden = vim.g.telescope_live_grep_hidden

          -- Build rg args each time (so toggle takes effect immediately)
          local args = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          }

          if hidden then
            -- include hidden, but ignore .git
            vim.list_extend(args, { "--hidden", "--glob", "!.git/*" })
          end

          require("telescope.builtin").live_grep({
            vimgrep_arguments = args,
            prompt_title = hidden and "Live Grep (hidden)" or "Live Grep",
          })
        end,
        desc = "Live Grep (toggle hidden)",
      },
    },
  },
}
