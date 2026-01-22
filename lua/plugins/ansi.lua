return {
  "m00qek/baleia.nvim",
  version = "*",
  config = function()
    local baleia = require("baleia").setup({
      -- defaults are usually fine; optional tweaks:
      -- strip_ansi_codes = true,
      -- log = "ERROR",
    })

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWinEnter" }, {
      pattern = { "*.log" },
      callback = function(args)
        baleia.once(args.buf)
      end,

      -- used to colorize for streaming files
      -- callback = function(args)
      --   baleia.automatically(args.buf)
      -- end,
    })

    -- Optional: command to manually colorize current buffer once
    vim.api.nvim_create_user_command("AnsiColorize", function()
      baleia.once(vim.api.nvim_get_current_buf())
    end, {})
  end,
}
