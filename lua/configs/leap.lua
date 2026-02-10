
return {
  setup = function() 
    local ok, leap = pcall(require, "leap")
    if not ok then
      return
    end
    vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
    vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
    vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
    -- Treesitter node selection
    vim.keymap.set({'x', 'o'}, 'R',  function ()
      require('leap.treesitter').select {
        opts = require('leap.user').with_traversal_keys('R', 'r')
      }
    end)
    -- Use the traversal keys to repeat the previous motion without
    -- explicitly invoking Leap:
    -- TODO: This breaks enter navigating to a quickfixlist entry. Probably don't need it at all.
    -- require('leap.user').set_repeat_keys('<enter>', '<backspace>')
  end,
}
