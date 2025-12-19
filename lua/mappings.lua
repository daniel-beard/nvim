require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- Remap nvim's default-mapping that maps Y to y$
map("n", "Y", "yy", { desc = "Yank line" })
map("n", "[q", "<cmd> cprev <CR>", { desc = "Previous quickfixlist entry" })
map("n", "]q", "<cmd> cnext <CR>", { desc = "Next quickfixlist entry" })

map("i", "jk", "<ESC>")

map("v", ">", ">gv", { desc = "Indent" })

