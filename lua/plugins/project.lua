local M = {
  "ahmedkhalf/project.nvim",

  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  keys = {
    {
      "<Leader>P",
      function()
        local project = require("project_nvim")
        project.get_recent_projects()
        os.execute("sleep 0.2")
        project.get_recent_projects()
        require("telescope").extensions.projects.projects()
      end,
      desc = "Projects"
    },
  },
}

function M.config()
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
  })
  require("telescope").load_extension("projects")
end

return M
