local M = {}

M.config = require("nvchad.configs.telescope")

M.config.defaults.mappings.i = {
  ["<C-j>"] = "move_selection_next",
  ["<C-k>"] = "move_selection_previous",
}
M.config.defaults.mappings.v = {
  ["<C-j>"] = "move_selection_next",
  ["<C-k>"] = "move_selection_previous",
}

return M
