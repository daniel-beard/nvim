-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
}

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
    }
    run_make()
  end,
  {
    desc = "Run xcodebuild and display results in quickfixlist"
  }
)

-- Quickfixlist
vim.cmd("packadd cfilter")

--
-- vim.api.nvim_create_user_command(
--   'Periphery',
--   function()
--     vim.opt_local.makeprg = "periphery scan"
--     vim.opt_local.errorformat = {
--       "%f:%l:%c: %tarning: %m"
--     }
--     run_make()
--   end,
--   {
--     desc = "Run periphery and display results in quickfixlist"
--   }
-- )

return M
