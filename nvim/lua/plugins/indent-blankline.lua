return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufNew",
    config = function()
      vim.opt.list = true

      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = false,
        vim.cmd [[ let g:indent_blankline_filetype_exclude = [ "lspinfo", "packer", "checkhealth", "help", "man", "dashboard", "" ] ]],
      }
    end,
  },
}
