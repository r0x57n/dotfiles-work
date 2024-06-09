return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function ()
      require("git-conflict").setup {
        default_mappings = false,
        default_commands = false,
        disable_diagnostics = false,
      }
    end,
  }
}
