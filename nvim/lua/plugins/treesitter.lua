return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "css",
          "typescript",
          "javascript",
          "tsx",
          "c",
          "cpp",
          "markdown_inline",
          "markdown",
          "vim",
          "dockerfile",
          "gitignore",
          "lua",
          "jsonc",
          "yaml",
          "bash",
          "regex"
        },
        highlight = {
          enable = true,
        }
      }
    end,
  },
}
