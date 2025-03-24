local M = { "folke/which-key.nvim" }

function M.config()
  require("which-key")

  local mappings = {
    { "<Leader>?", "<Cmd>WhichKey<CR>", desc = "Keys" },
    { "<Leader>F", group = "Font" },
    { "<Leader>e", group = "explore" },
    { "<Leader>f", group = "find" },
  }

  require("which-key").add(mappings)
end

return M
