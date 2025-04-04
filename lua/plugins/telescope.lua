local function find(source)
  return function()
    require("telescope.builtin")[source]()
  end
end

return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-S>"] = actions.send_selected_to_qflist + actions.open_qflist
          }
        }
      }
    })
  end,

  keys = {
    { "<Leader>/",       find("current_buffer_fuzzy_find"),     desc = "Search" },
    { "<Leader><Space>", find("buffers"),                       desc = "Buffers" },
    { "<Leader>fa",      find("autocommands"),                  desc = "Autocommands" },
    { "<Leader>fc",      find("commands"),                      desc = "Commands" },
    { "<Leader>ff",      find("find_files", { hidden = true }), desc = "Files" },
    { "<Leader>fg",      find("live_grep"),                     desc = "Grep" },
    { "<Leader>fh",      find("help_tags"),                     desc = "Help" },
    { "<Leader>fl",      find("loclist"),                       desc = "Location list" },
    { "<Leader>fq",      find("quickfix"),                      desc = "Quickfix list" },
  },
}
