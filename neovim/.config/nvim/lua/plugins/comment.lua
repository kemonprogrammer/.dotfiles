-- # Comments
-- Also use CTRL + / in insert mode to toggle comments

local function toggle_comment()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line_before = vim.api.nvim_get_current_line()

  -- Toggle the comment on the current line
  require('Comment.api').toggle.linewise.current()

  local line_after = vim.api.nvim_get_current_line()

  -- Calculate offset based on line length difference (handles both commenting & uncommenting)
  local diff = #line_after - #line_before
  if vim.bo.filetype == 'html' then
    if diff < 0 then
      diff = diff + 4
    else
      diff = diff - 4
    end
  end
  local new_col = math.max(0, col + diff)

  -- Move cursor to adjust for inserted/removed characters
  vim.api.nvim_win_set_cursor(0, { row, new_col })
end

vim.keymap.set({ 'n', 'i' }, '<C-/>', toggle_comment, { desc = 'Toggle comment' })

vim.keymap.set('x', '<C-/>', '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>')
