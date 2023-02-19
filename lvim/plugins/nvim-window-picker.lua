-- An awesome method to jump to windows

return {
  "s1n7ax/nvim-window-picker",
  config = function()
    local picker = require("window-picker")
    picker.setup({
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

          -- if the buffer type is one of following, the window will be ignored
          buftype = { "terminal" },
        },
      },
      other_win_hl_color = "#e35e4f",
    })

    vim.keymap.set("n", ",w", function()
      local picked_window_id = picker.pick_window({
        include_current_win = true,
      }) or vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(picked_window_id)
    end, { desc = "Pick a window" })

    -- Swap two windows using the awesome window picker
    local function swap_windows()
      local window = picker.pick_window({
        include_current_win = false,
      })
      local target_buffer = vim.fn.winbufnr(window)
      -- Set the target window to contain current buffer
      vim.api.nvim_win_set_buf(window, 0)
      -- Set current window to contain target buffer
      vim.api.nvim_win_set_buf(0, target_buffer)
    end

    vim.keymap.set("n", ",W", swap_windows, { desc = "Swap windows" })

  end,
}
