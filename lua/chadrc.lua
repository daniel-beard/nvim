-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
}

M.term = {
	float = {
		relative = "editor",
		row = 0.05,
		col = 0.05,
		width = 0.9,
		height = 0.85,
		border = "single",
	},
}

--TODO: Give this a mapping
-- Search for non-ascii characters:
-- :set hlsearch
-- /[^[:alnum:][:punct:][:space:]]/

local function run_make()
  vim.cmd[[silent make]]
  if #(vim.fn.getqflist()) > 0 then
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end

vim.api.nvim_create_user_command(
  'XcodeBuild',
  function()
    vim.opt_local.makeprg = "just quickfixlist"
    vim.opt_local.errorformat = {
      "%f:%l:%c: %trror: %m"
      -- "%f:%l:%c: %tarning: %m"
    }
    run_make()
  end,
  {
    desc = "Run xcodebuild and display results in quickfixlist"
  }
)

vim.api.nvim_create_user_command(
  'SB',
  function()
    vim.cmd[[compiler stack]]
    vim.cmd[[Make]]
  end,
  {
    desc = "Run 'stack build' and display results in quickfixlist"
  }
)

-- Quickfixlist
vim.cmd("packadd cfilter")

-- Show invisibles
vim.cmd("set list listchars=tab:❘⠀,extends:»,precedes:«,nbsp:×,eol:⏎")

return M
