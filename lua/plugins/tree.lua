return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    sync_root_with_tree = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true
    },
    hijack_directories = { enable = false },
    renderer = {
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      }
    },
  },

  cmd = {
    "NvimTreeToggle",
    "NvimTreeFindFileToggle"
  },

  keys = {
    { "<Leader>ee", "<Cmd>NvimTreeToggle<CR>",         desc = "Root (toggle)" },
    { "<Leader>ef", "<Cmd>NvimTreeFindFileToggle<CR>", desc = "File (toggle)" },
  },
}
