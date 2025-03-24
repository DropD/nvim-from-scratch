local M = { "echasnovski/mini.nvim" }

function M.align()
  require("mini.align").setup()
end

function M.comment()
  require("mini.comment").setup({})
end

function M.pairs()
  require("mini.pairs").setup({})
end

function M.ai()
  require("mini.ai").setup({})
end

function M.icons()
  require("mini.icons").setup()
end

function M.indentscope()
  require("mini.indentscope").setup({})
end

function M.completion()
  require("mini.completion").setup({})
end

function M.config()
  M.align()
  M.comment()
  M.pairs()
  M.ai()
  M.icons()
  M.indentscope()
  M.completion()
end

return M
