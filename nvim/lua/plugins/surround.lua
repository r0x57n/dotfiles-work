return {
  {
    "echasnovski/mini.surround",
    version = false,
    config = function ()
      require("mini.surround").setup {
        highlight_duration = 0,
        silent = true,
        mappings = {
          add             = 'gza', -- Add surrounding in Normal and Visual modes
          delete          = 'gzd', -- Delete surrounding
          find            = 'gzf', -- Find surrounding (to the right)
          find_left       = 'gzF', -- Find surrounding (to the left)
          highlight       = 'gzh', -- Highlight surrounding
          replace         = 'gzr', -- Replace surrounding
          update_n_lines  = 'gzn', -- Update `n_lines`

          suffix_last     = '', -- Suffix to search with "prev" method
          suffix_next     = '', -- Suffix to search with "next" method
        },
      }
    end
  },
}
