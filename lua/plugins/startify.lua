local function recent_projects()
  local projects = require("project_nvim").get_recent_projects()
  local dashboard = require("alpha.themes.dashboard")
  local plenary_path = require("plenary.path")

  local tbl = {}
  for i, name in ipairs(projects) do
    local shortname = plenary_path.new(name):shorten(1, { -2, -1 })
    local shortcut = "<C-p>" .. i
    tbl[i] = dashboard.button(
      shortcut,
      shortname,
      "<cmd>lua require('telescope').extensions.projects.projects({ default_text = '" .. name .. "' })<CR>"
    )
  end
  return tbl
end

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "ahmedkhalf/project.nvim" },
  config = function()
    local theta = require("alpha.themes.theta")
    table.insert(theta.config.layout, 4, {
      type = "group",
      val = {
        { type = "text",    val = "Projects",      opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        { type = "group",   val = recent_projects, opts = { shrink_margin = false } }
      }
    })
    table.insert(theta.config.layout, 5, { type = "padding", val = 2 })
    require("alpha").setup(require("alpha.themes.theta").config)
  end
}
