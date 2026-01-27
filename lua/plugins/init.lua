return {
  { "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  { "nvim-tree/nvim-tree.lua",
    opts = {
      system_open = {
        cmd = "open",
        args = { "-R" },
      },
    },
  },
  
  { "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- https://github.com/nvim-mini/mini.align
  { "nvim-mini/mini.align",
    version = "*",
    init = function()
      require('mini.align').setup()
    end,
  },


  { "https://codeberg.org/andyg/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    lazy = false,
    init = function() 
      require('configs.leap').setup()
    end,
  },

  { "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "c",
          "css",
          "haskell",
          "html",
          "javascript",
          "lua",
          "markdown",
          "markdown_inline",
          "ruby",
          "swift",
          "typescript",
          "tsx",
          "vim",
          "vimdoc"
        },
    },
  },
}
