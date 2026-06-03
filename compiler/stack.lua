if vim.b.current_compiler then
  return
end
vim.b.current_compiler = "stack"

vim.opt_local.makeprg = "stack build"

-- From: https://jeancharles.quillet.org/posts/2024-09-04-Haskell-dev-workflow-with-ghcid-and-neovim.html
vim.opt_local.errorformat = {
  "%E%f:%l:%c: %trror: %m,%E%f:%l:%c: %tatal: %m,%W%f:%l:%c: %tarin: %m,%Z%p^,%-C%#"
}
  

-- Stack build output format (file|line col col error|)
  -- "%E%f|%l col %c %trror| %m",
  -- "%W%f|%l col %c %tarning| %m"
  -- GHC formats
  -- "%W%f:(%l\\,%c)-(%e\\,%k): %tarning: %m",
  -- "%W%f:(%l\\,%c)-(%e\\,%k): %tarning:",
  -- "%W%f:%l:%c-%k: %tarning: %m",
  -- "%W%f:%l:%c-%k: %tarning:",
  -- "%W%f:%l:%c: %tarning: %m",
  -- "%W%f:%l:%c: %tarning:",
  -- "%E%f:(%l\\,%c)-(%e\\,%k): %trror: %m",
  -- "%E%f:(%l\\,%c)-(%e\\,%k): %trror:",
  -- "%E%f:%l:%c-%k: %trror: %m",
  -- "%E%f:%l:%c-%k: %trror:",
  -- "%E%f:%l:%c: %trror: %m",
  -- "%E%f:%l:%c: %trror:",
