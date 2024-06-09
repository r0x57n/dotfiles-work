local vim = vim;
-- clear search on esc (removed, feels like esc gets slower)
--vim.cmd [[ nnoremap <esc> :noh<return><esc> ]]
--vim.cmd [[ nnoremap <esc>^[ <esc>^[ ]]

-- visual line navigation
vim.cmd [[ nnoremap j gj]]
vim.cmd [[ nnoremap k gk]]

-- Global lsp mappings
vim.keymap.set("n", "<space>lf",      vim.diagnostic.open_float)
vim.keymap.set("n", "<space>ln",      vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>lp",      vim.diagnostic.goto_prev)
--vim.keymap.set("n", "<space>lq",      vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD",             vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd",             vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K",              vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi",             vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gK",             vim.lsp.buf.signature_help, opts)
   -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
   -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
   -- vim.keymap.set('n', '<space>wl', function()
   --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   -- end, bufopts)
    vim.keymap.set("n", "<space>D",       vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>lr",      vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>lc",      vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr",             vim.lsp.buf.references, opts)
  end,
})

-- which key conf
local wk = require("which-key")
wk.register({
	["<space>"] = {"<cmd>Telescope find_files<cr>",     "Find files"},
  ["/"]       = {"<cmd>Telescope live_grep<cr>",      "Search for a string in your current working directory"},
	["1"]       = {"1gt",                               "Goto tab 1"},
	["2"]       = {"2gt",                               "Goto tab 2"},
	["3"]       = {"3gt",                               "Goto tab 3"},
	["4"]       = {"4gt",                               "Goto tab 4"},
	["5"]       = {"5gt",                               "Goto tab 5"},
	["6"]       = {"6gt",                               "Goto tab 6"},
	["7"]       = {"7gt",                               "Goto tab 7"},
	["<tab>"] = {
		name        = "sessions",
		["<tab>"]   = {"<cmd>Telescope persisted<cr>",    "List session"},
		d           = {"<cmd>SessionDelete<cr>",          "Delete current session"},
		l           = {"<cmd>SessionLoad<cr>",            "Load the session for the current directory and branch"},
		r           = {"<cmd>SessionLoadLast<cr>",        "Load the most [R]ecent session"},
		s           = {"<cmd>SessionSave<cr>",            "Save current session"},
	},
	b = {
		name    = "buffer",
		["]"]   = {"<cmd>bnext<cr>",                "Next buffer"},
		["["]   = {"<cmd>bprevious<cr>",            "Previous buffer"},
		b       = {"<cmd>Telescope buffers<cr>",    "List all buffers"},
		d       = {"<cmd>bdelete<cr>",              "Kill buffer"},
		h       = {"<cmd>bprevious<cr>",            "Previous buffer"},
		l       = {"<cmd>bnext<cr>",                "Next buffer"},
	},
	f = {
		name    = "file",
		f       = {"<cmd>Telescope file_browser<cr>",   "Filebrowser"},
		s       = {":w!<cr>",                           "Save file"},
	},
	h = {
		name    = "help",
		h       = {"<cmd>Telescope help_tags<cr>",      "Lists available help tags"},
		k       = {"<cmd>Telescope keymaps<cr>",        "Lists normal mode keymappings"},
		m       = {"<cmd>Telescope man_pages<cr>",      "Lists manpage entries"},
		q       = {"<cmd>qa<cr>",                       "Quit neovim"},
		v       = {"<cmd>Telescope vim_options<cr>",    "Lists vim options"},
	},
  j = {
    name = "jump",
    b = {"<cmd>cd ~/.bin/<cr><cmd>Neotree<cr>",                         "~/.bin"},
    i = {
      name = "i3",
      d = {"<cmd>e ~/.config/i3/desktop.conf<cr>",                      "Edit desktop"},
      f = {"<cmd>cd ~/.config/i3/<cr><cmd>Neotree<cr>",                 "Open folder"},
      l = {"<cmd>e ~/.config/i3/setups/laptop.conf<cr>",                "Edit laptop"},
      m = {"<cmd>e ~/.config/i3/main.conf<cr>",                         "Edit main"},
      w = {"<cmd>e ~/.config/i3/setups/work.conf<cr>",                  "Edit work"},
    },
    v = {
      name = "nvim",
      f    = {"<cmd>cd ~/.config/nvim/<cr><cmd>Neotree<cr>",            "Open folder"},
      i    = {"<cmd>e ~/.config/nvim/init.lua<cr>",                     "Edit init.lua"},
      k    = {"<cmd>e ~/.config/nvim/lua/config/keymap.lua<cr>",        "Edit keymap.lua"},
      m    = {"<cmd>e ~/.config/nvim/lua/plugins/mason.lua<cr>",        "Edit mason.lua"},
      p    = {"<cmd>cd ~/.config/nvim/lua/plugins/<cr><cmd>Neotree<cr>","Open plugins"},
    },
    o = {"<cmd>cd ~/.obsidian/<cr><cmd>Neotree<cr>",                    "~/.obsidian"},
    z = {"<cmd>e ~/.zshrc<cr>",                                         "~/.zshrc"},
  },
  l = {
    name    = "LSP/prog",
    c       =                                               "Code action",
    d       = {"<cmd>Telescope lsp_document_symbols<cr>",   "Document symbols buffer"},
    f       =                                               "Open float",
    h       = {"<cmd>LspInfo<cr>",                          "Show status"},
    i       = {"<cmd>Telescope lsp_incoming_calls<cr>",     "Incoming calls"},
    l       = {"<cmd>Telescope diagnostics bufnr=0<cr>",    "Show erros in list"},
    n       =                                               "Goto next error",
    o       = {"<cmd>Telescope lsp_outgoing_calls<cr>",     "Outgoing calls"},
    p       =                                               "Goto previous error",
    --r       = {"<cmd>Telescope lsp_references<cr>",         "References"},
    r       =                                               "LSP rename",
		t       = {"<cmd>Telescope treesitter<cr>",             "Lists TS function names, variables"},
    w       = {"<cmd>Telescope lsp_workspace_symbols<cr>",  "Document symbols workspace"},
  },
  m = {
    name = "misc",
    c       = {"<cmd>HighlightColorsToggle<cr>",                        "Toggle highlight colors"},
    d       = {"<cmd>put! =strftime('%Y-%m-%d')<cr>A",                  "Insert date"},
    b       = {"<cmd>lua require'gitsigns'.blame_line{full=true}<cr>",  "Toggle git blame full"},
    g       = {"<cmd>Gitsigns toggle_current_line_blame<cr>",           "Toggle git blame line"},
    i       = {"<cmd>IlluminateToggle<cr>",                             "Toggle illuminate"},
    m       = {
      name  = "markdown",
      p     = {"<cmd>MarkdownPreviewToggle<cr>",                        "Toggle markdown preview"},
      t     = {"<cmd>TableModeToggle<cr>",                              "Toggle markdown table mode"},
    },
    o       =                                                           "Toggle window opacity",
    p       = {
      name  = "project",
      c     = {"<cmd>cd %:h<cr>",                                       "Set [C]urrent folder as root"},
      r     = {"<cmd>Rooter<cr>",                                       "Toggle rooter"},
    },
    s       = {"<cmd>set invspell<cr>",                                 "Toggle spelling"},
    w       = { function ()
                  os.execute("ln -sv ./.clang_complete ./compile_flags.txt")
                  vim.fn.execute("LspRestart")
                end,                                                    "Set clang flags"},
  },
	o = {
		name    = "open",
		f       = {"<cmd>Neotree filesystem focus reveal<cr>",  "Focus current file in neo-tree"},
		p       = {"<cmd>Neotree filesystem focus<cr>",         "Focus or open neo-tree"},
    m       = {"<cmd>lua MiniFiles.open()<cr>",             "Open minifiles"},
		t       = {"<cmd>silent !tmux split-window -p 35<cr>",  "Open terminal"},
		P       = {"<cmd>Neotree filesystem toggle<cr>",        "Close neo-tree"},
	},
  p = {
    name    = "plugins",
    l = {
      name = "lazy",
      ["?"] = {"<cmd>Lazy help<cr>",         "Help"},
      c     = {"<cmd>Lazy clean<cr>",        "Clean plugins"},
      d     = {"<cmd>Lazy debug<cr>",        "Show debug information"},
      h     = {"<cmd>checkhealth lazy<cr>",  "Health"},
      i     = {"<cmd>Lazy install<cr>",      "Install missing plugins"},
      l     = {"<cmd>Lazy log<cr>",          "Log, show recent updates"},
      s     = {"<cmd>Lazy sync<cr>",         "Sync plugins (install, clean, update)"},
      o     = {"<cmd>Lazy home<cr>",         "Open Lazy"},
    },
    m = {
      name = "mason",
      h = {"<cmd>checkhealth mason<cr>",  "Health"},
      k = {"<cmd>LspStop<cr>",            "Kill LSP"},
      l = {"<cmd>MasonLog<cr>",           "Open mason log"},
      n = {"<cmd>NullLsInfo<cr>",         "Open null-ls"},
      o = {"<cmd>Mason<cr>",              "Open mason" },
      r = {"<cmd>LspRestart<cr>",         "Restart LSP"},
      s = {"<cmd>LspStart<cr>",           "Start LSP"},
      u = {"<cmd>MasonUpdate<cr>",        "Update all managed registries"},
    },
    n = {
      name = "noice",
      a = {"<cmd>Noice telescope<cr>",    "Show all"},
      d = {"<cmd>Noice dismiss<cr>",      "Dismiss all"},
      e = {"<cmd>Noice errors<cr>",       "Show errors"},
      h = {"<cmd>checkhealth noice<cr>",  "Health"},
      l = {"<cmd>Noice list<cr>",         "Show last"},
    },
    t = {
      name = "telescope",
      h = {"<cmd>checkhealth telescope<cr>",  "Health"},
    }
  },
	s = {
		name    = "search",
    ["/"]   = {"<cmd>Telescope current_buffer_fuzzy_find<cr>",  "Live fuzzy search inside of the currently open buffer"},
    n       = {"<cmd>nohlsearch<cr>",                           "Remove highlights from search"},
	},
	t = {
		name    = "tabs",
		["]"]   = {"<cmd>tabnext<cr>",      "Next tab"},
		["["]   = {"<cmd>tabprevious<cr>",  "Previous tab"},
		["1"]   = {"1gt",                   "Goto tab 1"},
		["2"]   = {"2gt",                   "Goto tab 2"},
		["3"]   = {"3gt",                   "Goto tab 3"},
		["4"]   = {"4gt",                   "Goto tab 4"},
		["5"]   = {"5gt",                   "Goto tab 5"},
		d       = {"<cmd>tabclose<cr>",     "Delete tab"},
		h       = {"<cmd>tabprevious<cr>",  "Previous tab"},
		l       = {"<cmd>tabnext<cr>",      "Next tab"},
		n       = {"<cmd>tabnew<cr>",       "New tab"},
		H       = {"<cmd>tabm -1<cr>",      "Move tab left"},
		L       = {"<cmd>tabm +1<cr>",      "Move tab right"},
	},
	w = {
		name    = "window",
		d       = {"<c-w>q",        "Close current window"},
		h       = {"<c-w>h",        "Left window"},
		j       = {"<c-w>j",        "Down window"},
		k       = {"<c-w>k",        "Up window"},
		l       = {"<c-w>l",        "Right window"},
		r       = {"<c-w>r",        "Rotate windows"},
		s       = {"<c-w>s",        "Split horizontal"},
		v       = {"<c-w>v",        "Split vertical"},
		z       = {"<c-w><c-_>",    "Zoom window if in horizontal split"},
		w       = {"<c-w>w",        "Next window"},
		S       = {"<c-w>S",        "Split horizontal and follow"},
    T       = {"<c-w>T",        "Move window to new tab"},
		V       = {"<c-w>V",        "Split vertical and follow"},
	},
  x = {
    name    = "trouble",
    d       = {"<cmd>TroubleToggle document_diagnostics<cr>",   "Document diagnostics"},
    l       = {"<cmd>TroubleToggle loclist<cr>",                "Loclist"},
    w       = {"<cmd>TroubleToggle workspace_diagnostics<cr>",  "Workspace diagnostics"},
    x       = {"<cmd>TroubleToggle<cr>",                        "Toggle"},
  },
  D = "Type definition",
  M = {
    name = "Minne",
    c = {"<cmd>lua require('minne').createTing()<cr>",     "Create ting" },
    f = {"<cmd>lua require('minne').findPost()<cr>",       "Find Tings post" },
    m = {"<cmd>lua require('minne').moveTing()<cr>",       "Move post and ting" },
    t = {"<cmd>lua require('minne').changeType()<cr>",     "Change type of Ting" },
  },
}, { prefix = "<leader>" })
