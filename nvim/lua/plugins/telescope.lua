return {
  {
    {
      "nvim-telescope/telescope.nvim", branch = "0.1.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",   -- FZF sorter for telescope written in c
        "nvim-treesitter/nvim-treesitter",            -- use telescope to find/preview
        "olimorris/persisted.nvim",                   -- use telescope to show sessions
      },
      config = function ()
        -- extensions
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("persisted")

        -- config
        require("telescope").setup {
          pickers = {
            find_files = {
              theme = "ivy"
            },
            buffers = {
              sort_mru = true,
              ignore_current_buffer = true,
            }
          },
          defaults = {
            layout_strategy =  "bottom_pane",
            layout_config = {
              height = 0.3,
            },
            border = true,
            sorting_strategy = "ascending",
          },
        }

      end,
    },

    -- c port of fzf
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },

    -- telescope filebrowser
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
      },
    }
  },
}
