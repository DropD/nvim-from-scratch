return {
  "folke/todo-comments.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    search = {
      pattern = [[\b(KEYWORDS)\b(.*):]],
    },
  },

  config = true
}
