local M = {
  "ahmedkhalf/project.nvim",

  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  keys = {
    { "<Leader>P", "<Cmd>Telescope projects<CR>", desc = "Projects" },
  },
}

function M.config()
  require("project_nvim").setup {}
  require("telescope").load_extension("projects")
  require("project_nvim").setup({
    patterns = {
      ".git",
      "_darcs",
      ".hg", ".bzr",
      ".svn",
      "Makefile",
      "package.json",
      "pyproject.toml"
    },
    scope_chdir = "tab",
  })
end

return M
