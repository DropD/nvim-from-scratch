return {
  "folke/todo-comments.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS)|(TODO\(.*\)).*:|]]
    },
    search = {
      pattern = [[\b(KEYWORDS)|(TODO\(.*\)).*:]],
    },
  },

  config = true
}
