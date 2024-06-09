return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      require("neo-tree").setup {
        close_if_last_window = true,
        window = {
          width = 30,
          mappings = {
            ["o"] = {
              "toggle_node",
              nowait = true,
            },
          }
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        auto_clean_after_session_restore = true, -- otherwise the neo-tree buffer might be removed on session restart
      }
    end
  },
}
