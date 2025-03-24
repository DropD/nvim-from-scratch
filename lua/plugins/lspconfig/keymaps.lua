local M = {}

function M.setup(client, buffer)
  local lsp = vim.lsp
  local telescope = require("telescope.builtin")
  local formatting = client.supports_method("textDocument/formatting")

  local mappings = {
      {
        buffer = buffer,
        { "<LocalLeader>", group = "lsp" },
        { "<LocalLeader>R", lsp.buf.rename, desc = "Rename" },
        { "<LocalLeader>S", telescope.lsp_workspace_symbols, desc = "Symbols" },
        { "<LocalLeader>a", lsp.buf.code_action, desc = "Code actions" },
        { "<LocalLeader>d", vim.diagnostic.open_float, desc = "Diagnostics" },
        { "<LocalLeader>f", lsp.buf.format, desc = "Format", cond = formatting },
        { "<LocalLeader>r", telescope.lsp_references, desc = "References" },
        { "<LocalLeader>s", telescope.lsp_document_symbols, desc = "Symbols" },
        { "<LocalLeader>g", lsp.buf.definition, desc = "Go to definition" },
        { "K", lsp.buf.hover, desc = "Hover" },
        { "<C-]>", lsp.buf.definition, desc = "Go to definition" },
        { "[d", lsp.diagnostic.goto_prev, desc = "Prev diagnostic"},
        { "]d", lsp.diagnostic.goto_next, desc = "Next diagnostic"},
      }
    }
  require("which-key").add(mappings)
end

return M
