require("nvchad.configs.lspconfig").defaults()

local servers = { "hls", "html", "cssls", "sourcekit" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
