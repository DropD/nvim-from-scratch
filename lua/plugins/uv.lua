local M = {
  "benomahony/uv.nvim"
}

function M.config()
  require("uv").setup({
    keymaps = {
      prefix = "<Leader>u"
    }
  })
end

return M
