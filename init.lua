-- Bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=main",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

-- Load core config
require("config.abbrevs")
require("config.commands")
require("config.keymaps")
require("config.options")

-- Load plugin manager
require("lazy").setup("plugins", {
  change_detection = { notify = false },
  install = {
    colorscheme = { "tokyonight-night" },
  },
})

vim.cmd.colorscheme("gruvbox")

local fonts = function(opts)
  opts = opts or {}
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.conf")
  pickers.new(opts, {
    prompt_title = "Gui Fonts",
    finder = finders.new_table {
      results = {
        "CaskaydiaCove Nerd Font Propo",
        "FiraCode Nerd Font Propo",
        "Iosevka Nerd Font Propo",
        "JetBrainsMono Nerd Font Propo",
        "M+1Code Nerd Font Propo",
        "M+2Code Nerd Font Propo",
        "NotoMono Nerd Font Propo",
        "Overpass Nerd Font Propo",
        "RobotoMono Nerd Font Propo",
        "SauceCodePro Nerd Font Propo",
        "VictorMono Nerd Font Propo"
      }
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.opts.guifont = { selection .. ":h15" }
      end)
      return true
    end
  }):find()
end

vim.keymap.set("n", "<Leader>Fs", function() fonts(require("telescope.themes").get_dropdown({})) end,
  { desc = "Select Gui Font" })
