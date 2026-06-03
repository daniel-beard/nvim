require("nvchad.configs.lspconfig").defaults()

-- For list of LSPs
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local servers = { "dhall_lsp_server", "hls", "html", "cssls", "ruby_lsp", "sourcekit" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
