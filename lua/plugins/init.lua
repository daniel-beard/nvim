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
      git = {
        -- Show the ignored git files by default
        ignore = false,
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

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "configs.telescope"
    end,
  },


  { "https://codeberg.org/andyg/leap.nvim",
    -- dependencies = { "tpope/vim-repeat" },
    lazy = false,
    init = function() 
      require('configs.leap').setup()
    end,
  },

  -- https://github.com/tpope/vim-dispatch
  { "tpope/vim-dispatch",
    lazy = true,
    cmd = {'Dispatch', 'Make', 'Focus', 'Start'},
  },

  { "vimwiki/vimwiki",
  -- The event that triggers the plugin
  event = "BufEnter *.md",
  -- The keys that trigger the plugin
  keys = { "<leader>ww", "<leader>wt" },
  -- The configuration for the plugin
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/",
        syntax = "markdown",
        ext = "md",
      },
    }
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
