return {
  "m00qek/baleia.nvim",
  version = "*",
  event = { "BufReadPre *.log", "BufNewFile *.log" },
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
        -- Strip terminal control sequences that baleia doesn't handle
        -- (cursor movement, line clearing, synchronized output, etc.)
        local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
        local dirty = false
        for i, line in ipairs(lines) do
          local cleaned = line:gsub("\27%[%??[%d;]*[A-Za-z]", "")
          if cleaned ~= line then
            lines[i] = cleaned
            dirty = true
          end
        end
        if dirty then
          vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, lines)
          baleia.once(args.buf)
        end
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
