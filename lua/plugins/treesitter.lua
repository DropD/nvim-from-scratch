local M = { "nvim-treesitter/nvim-treesitter" }

M.dependencies = {
  "nvim-treesitter/playground",
}

M.build = ":TSUpdate"

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "css",
      "diff",
      "elixir",
      "gitignore",
      "heex",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "query",
      "regex",
      "sql",
      "toml",
      "yaml",
      "python",
      "haskell",
      "cpp",
      "rust"
    },
    sync_install = false,
    ignore_install = {},
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
