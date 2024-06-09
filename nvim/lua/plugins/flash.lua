return {
  {
    "folke/flash.nvim",
    priority = 100000,
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
    config = function()
      require("flash").setup {}
      vim.api.nvim_set_hl(0, "FlashBackdrop", { bg = "#2E353F" }) -- backdrop for s
      vim.api.nvim_set_hl(0, "FlashMatch", { link = "Visual" }) -- matches on s
      vim.api.nvim_set_hl(0, "FlashCurrent", { fg= "Purple", bg = "Purple" })
      vim.api.nvim_set_hl(0, "FlashLabel", { link = "Visual" })
    end,
  },
}
