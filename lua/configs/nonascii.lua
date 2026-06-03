local M = {}

vim.api.nvim_set_hl(0, "NonAscii", { bg = "Red", ctermbg = 1, standout = true })

vim.g.nonascii_highlight = true

function M.add_nonascii_match(win)
  for _, m in ipairs(vim.fn.getmatches(win)) do
    if m.group == "NonAscii" then
      return
    end
  end
  vim.fn.matchadd("NonAscii", "[^\\x00-\\x7F]", 10, -1, { window = win })
end

function M.remove_nonascii_match(win)
  for _, m in ipairs(vim.fn.getmatches(win)) do
    if m.group == "NonAscii" then
      vim.fn.matchdelete(m.id, win)
    end
  end
end

function M.on_win_enter(args)
  -- Defer so plugins (nvim-tree, telescope, etc.) have time to set buftype="nofile"
  -- on their buffers before we decide whether to attach the match.
  vim.schedule(function()
    if not vim.g.nonascii_highlight then
      return
    end
    if not vim.api.nvim_buf_is_valid(args.buf) then
      return
    end
    -- Only highlight in real file buffers; skip terminals, nvim-tree, telescope, quickfix, help, etc.
    if vim.bo[args.buf].buftype ~= "" then
      return
    end
    local win = vim.api.nvim_get_current_win()
    if vim.api.nvim_win_get_buf(win) ~= args.buf then
      return
    end
    M.add_nonascii_match(win)
  end)
end

vim.api.nvim_create_user_command("NonAsciiToggle", function()
  vim.g.nonascii_highlight = not vim.g.nonascii_highlight
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.g.nonascii_highlight then
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == "" then
        M.add_nonascii_match(win)
      end
    else
      M.remove_nonascii_match(win)
    end
  end
  print("Non-ASCII highlight: " .. (vim.g.nonascii_highlight and "on" or "off"))
end, {})

return M
