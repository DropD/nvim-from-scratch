local M = {
  "ahmedkhalf/project.nvim",

  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  keys = {
    { "<Leader>P", "<Cmd>Telescope projects<CR>", desc = "Projects" }
  }
}

function M.config()
  require("project_nvim").setup {}
  require("telescope").load_extension("projects")
end

return M
