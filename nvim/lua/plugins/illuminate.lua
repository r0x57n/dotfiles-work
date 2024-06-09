return {
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure {
        providers = { "lsp", "treesitter" },
        delay = 500,
        under_cursor = false,
      }

      vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg="#2E353F" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

      require("illuminate").toggle()
      vim.cmd[[ IlluminateToggle ]]
    end,
  },
}
