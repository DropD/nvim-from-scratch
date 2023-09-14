return {
  "nvim-tree/nvim-tree.lua",

  opts = {
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
    { "<Leader>ee", "<Cmd>NvimTreeToggle<CR>", desc = "Root (toggle)" },
    { "<Leader>ef", "<Cmd>NvimTreeFindFileToggle<CR>", desc = "File (toggle)" },
  },
}
