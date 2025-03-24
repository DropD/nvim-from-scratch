local M = { "neovim/nvim-lspconfig" }

M.dependencies = {
  "folke/neodev.nvim",
  "williamboman/mason.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { automatic_installation = true, }
  },
}

function M.config()
  local servers = {
    bashls = {},
    elixirls = {},
    -- sumneko_lua = {
    --   Lua = {
    --     telemetry = { enable = false },
    --     workspace = { checkThirdParty = false },
    --   },
    -- },
    ruff = {
      init_options = {
        settings = {
          args = {
            "--config",
            "$HOME/.config/ruff/pyproject.toml"
          },
          format = {
            enable = false,
            args = {
              "--config",
              "$HOME/.config/ruff/pyproject.toml"
            }
          }
        }
      }
    },
    pyright = {
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- ignore = {"*"},
              autoImportCompletions = false,
              typeCheckingMode = "strict",
              diagnosticMode = "workspace",
            }
          }
        }
    },
    -- pylsp = {
    --   configurationSources = { "ruff" },
    --   plugins = {
    --     ruff = { enabled = false },
    --     -- ruff = {
    --     --   enabled = true,
    --     --   formatEnabled = false,
    --     --   config = "/Users/ricoh/.config/ruff/ruff.toml",
    --     --   extendSelect = { "I" },
    --     --   format = { "I" },
    --     --   ignore = { "E501" },
    --     --   targetVersion = "py310",
    --     --   lineLength = 120
    --     -- },
    --     autopep8 = { enabled = false },
    --     pyflakes = { enabled = false },
    --     pydocstyle = { enabled = false },
    --     flake8 = { enabled = false },
    --     mccabe = { enabled = true },
    --     pycodestyle = { enabled = false },
    --     pylint = { enabled = false },
    --     yapf = { enabled = false },
    --     jedi_completion = { enabled = true },
    --     jedi_definition = { enabled = true },
    --   }
    -- },
  }

  require("neodev").setup({})
  require("mason").setup()

  local function on_attach(client, buffer)
    require("plugins.lspconfig.keymaps").setup(client, buffer)
    require("plugins.lspconfig.formatting").setup(client, buffer)
    if client.name == "ruff_lsp" then
      -- disable hover (use something else) 
      client.server_capabilities.hoverProvider = false
    end

    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
    vim.wo.foldlevel = 99
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  local mason_lspconfig = require("mason-lspconfig")

  mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
  })

  mason_lspconfig.setup_handlers({
    function(server)
      require("lspconfig")[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server],
      })
    end,
  })
end

return M
