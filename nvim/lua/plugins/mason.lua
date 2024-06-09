return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",  -- easier to use lspconfig with mason
      "neovim/nvim-lspconfig",              -- configs for the nvim LSP client
      "jay-babu/mason-null-ls.nvim",        -- bridges mason and null-ls
      "jose-elias-alvarez/null-ls.nvim",    -- linting/formatting
    },
    config = function()
      require("mason").setup { }
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "gopls",
          "rust_analyzer",
          "julials",
          "pylsp",
          "clangd",
          "dockerls",
          "docker_compose_language_service",
          "bashls"
        }
      }

      -- Automatic server setup for servers installed via mason
      require("mason-lspconfig").setup_handlers {
        -- default handler
        function (server_name)
          require("lspconfig")[server_name].setup {
            -- completion
            capabilities = require("cmp_nvim_lsp").default_capabilities()
          }
        end,

        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = {"vim"},
                }
              }
            }
          }
        end,

        ["clangd"] = function ()
          local lspconfig = require("lspconfig")
          local ch_capabilities = require("cmp_nvim_lsp").default_capabilities()
          ch_capabilities.offsetEncoding = { "utf-16" } -- work
          lspconfig.clangd.setup{
            capabilities = ch_capabilities,
            root_dir =
            lspconfig.util.root_pattern(
              --".clangd",
              --".clang-tidy",
              --".clang-format",
              "compile_commands.json",
              --"compile_flags.txt",
              --"configure.ac",
              ".clang_complete", -- work
              ".git"
            ),
          }
        end,
      }

      -- linters/formatters
      require("mason-null-ls").setup {
        ensure_installed = {
          "luacheck",    -- linter lua
          "flake8",      -- linter python
          "biome",       -- linter css/html/json/js/ts/md
          "shellharden", -- linter/formatter bash
        },
        automatic_installation = false,
        handlers = {},
      }

      require("null-ls").setup {}

      require("lspconfig").vhdl_ls.setup {}
    end,
  },
}
