return {
  -- sessions
  {
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup { }
    end,
  },

  -- Markdown tables
  { "dhruvasagar/vim-table-mode" },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Project root finder
  {
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_patterns = {
        ".git",
        ".obsidian",
        "gt1100-wisi-core",
        "wisi-boot"
      }
      vim.g.rooter_manual_only = 1
    end,
  },

  -- deleting buffers has never been easier
  {
    "echasnovski/mini.bufremove",
    config = function()
      require("mini.bufremove").setup { }
    end,
  },

  -- remembering keys is hard
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("config.keymap")
    end,
  },

  -- switching between tmux->vim windows fluently
  {
    "aserowy/tmux.nvim",
    config = function()
        require("tmux").setup { }
    end,
  },

  {
    "echasnovski/mini.files",
    config = true,
    version = false
  },
}
