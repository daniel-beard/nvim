require "nvchad.mappings"

local map = vim.keymap.set
local term = require("nvchad.term")

map("n", ";", ":", { desc = "CMD enter command mode" })
-- Remap nvim's default-mapping that maps Y to y$
map("n", "Y", "yy", { desc = "Yank line" })
map("n", "[q", "<cmd> cprev <CR>", { desc = "Previous quickfixlist entry" })
map("n", "]q", "<cmd> cnext <CR>", { desc = "Next quickfixlist entry" })

map("i", "jk", "<ESC>")

-- Change indent while keeping selection
map("v", ">", ">gv", { desc = "Indent" })
map("v", "<", "<gv", { desc = "De-Indent" })

-- Terminal
map("n", "<leader>st", function()
  term.toggle { pos = "vsp", size = 0.4, cmd = "stack test --file-watch", id = "stack_test" } 
end, { desc = "Run `stack test --file-watch` in a term window" })
map("n", "<leader>sr", function()
  term.runner { pos = "float", cmd = "clear && stack run", id = "stack_run" }
end, { desc = "Run `stack run` in a term" })

-- Telescope
map("v", "<leader>gs", function()
  require('telescope.builtin').grep_string()
end, { desc = "Search for currently selected text" }
)
