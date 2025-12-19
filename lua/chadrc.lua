-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

 -- Restore cursor last position upon reopening the file 
vim.cmd([[ 
   augroup last_cursor_position 
   autocmd! 
   autocmd BufReadPost * 
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif 
   augroup END 
]])

local function run_make()
  vim.cmd[[silent make]]
  if #(vim.fn.getqflist()) > 0 then
	  vim.cmd.copen()
  else
	  vim.cmd.cclose()
  end
end

vim.api.nvim_create_user_command(
  'Periphery',
  function()
    vim.opt_local.makeprg = "periphery scan"
    vim.opt_local.errorformat = {
      "%f:%l:%c: %tarning: %m"
    }
    run_make()
  end,
  {
    desc = "Run periphery and display results in quickfixlist"
  }
)

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
