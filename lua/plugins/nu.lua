local M = {"LhKipp/nvim-nu"}

function M.config()
  require("nu").setup({
    use_lsp_features = false
  })
end

return M
