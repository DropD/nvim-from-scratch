------------------------------------------------------------
-- Keyboard Mappings
------------------------------------------------------------

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local set = vim.keymap.set

set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

set("n", "<Leader>p", "<Cmd>Lazy<CR>", { desc = "Plugins" })

set("n", "<C-p>", "<Leader>ff", { desc = "find files", noremap = true })

set("n", "<Leader>Fa", function() incrFontSize(1) end, { desc = "Increase Gui Font Size" })

set("n", "<Leader>Fx", function() incrFontSize(-1) end, { desc = "Decrease Gui Font Size" })

set(
  "n", "<Leader>Fs", function() selectFont(require("telescope.themes").get_dropdown({})) end,
  { desc = "Select Gui Font" }
)

function getFontAndSize()
  if vim.opt.guifont._value == "" then
    return { name = "", size = 15 } -- default
  end
  subs = {}
  for str in string.gmatch(vim.opt.guifont._value, "([^:h]+)") do
    table.insert(subs, str)
  end

  return { name = subs[1], size = tonumber(subs[2]) }
end

function incrFontSize(delta)
  local fontinfo = getFontAndSize()

  if fontinfo.name == "" then
    print("guifont not set")
    return
  end

  print("Changing font " .. fontinfo.name .. " " .. fontinfo.size .. " -> " .. fontinfo.size + delta)

  vim.opt.guifont = fontinfo.name .. ":h" .. fontinfo.size + delta
end

function selectFont(opts)
  opts = opts or {}
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config")
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
        "NotoSans Nerd Font Propo",
        "OverpassM Nerd Font Propo",
        "RobotoMono Nerd Font Propo",
        "SauceCodePro Nerd Font Propo",
        "VictorMono Nerd Font Propo"
      }
    },
    sorter = conf.values.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.opt.guifont = { selection[1] .. ":h" .. getFontSize() }
      end)
      return true
    end
  }):find()
end
