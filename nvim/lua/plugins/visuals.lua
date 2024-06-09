return {
  -- theme
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup { }
      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },

  -- startup dashboard
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup { }
    end,
    dependencies = {"nvim-tree/nvim-web-devicons"}
  },

  -- better statusline
  {
    "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("lualine").setup {
          options = {
            theme = "auto"
          }
      }
    end,
  },

  -- highlight rgb codes inside of vim
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup {
        enable_tailwind = true
      }
      require("nvim-highlight-colors").turnOff()
    end,
  },

  -- we all love matches
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup { }
    end
  },

  -- it's good to have context
  {
    "nvim-treesitter/nvim-treesitter-context"
  },

  -- shading for unused windows
  {
    "sunjon/shade.nvim",
    enabled = false, -- nice, but doesn't work with sessions
                     -- see https://github.com/sunjon/Shade.nvim/pull/31
    config = function()
      require("shade").setup {
        overlay_opacity = 70,
        keys = {
          toggle = "<Leader>mo"
        },
      }
    end,
  },
}
