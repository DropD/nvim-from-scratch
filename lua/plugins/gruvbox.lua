local M = { "ellisonleao/gruvbox.nvim" }

function M.config()
  vim.opt.background = "dark"
  vim.cmd.colorscheme("gruvbox")
end

return M
