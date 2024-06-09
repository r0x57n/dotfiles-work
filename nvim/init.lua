local vim = vim;
vim.g.mapleader = " " -- needs to be set beforu lazy loads

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  -- automatically check for config file changes and reload the ui
  change_detection = {
    enabled = true,
    notify = false,
  },
})

-- misc
vim.o.termguicolors = true
vim.wo.relativenumber = true
vim.cmd [[ set clipboard+=unnamedplus ]]
vim.cmd [[ set scrolloff=5 ]]
vim.cmd [[ set autoread ]]
vim.cmd [[ set foldenable ]]
vim.cmd [[ set foldmethod=marker ]]
vim.cmd [[ set linebreak ]]
vim.cmd [[ set numberwidth=3 ]]

-- markdown
vim.cmd [[ let g:vmt_auto_update_on_save = 0 ]]

-- tabs/spaces
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoread = true

-- update files if they change on disc
--- trigger `autoread` when files changes on disk
vim.cmd [[ set autoread ]]
vim.cmd [[ autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif ]]
--- notification after file change
vim.cmd [[ autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None ]]

-- temp fix for https://github.com/neovim/neovim/issues/21856
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.fn.jobstart('', {detach=true})
  end,
})
