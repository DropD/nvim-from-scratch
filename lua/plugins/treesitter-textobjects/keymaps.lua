local M = {}

function M.keymaps()
  return {
    -- You can use the capture groups defined in textobjects.scm
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    -- You can optionally set descriptions to the mappings (used in the desc parameter of
    -- nvim_buf_set_keymap) which plugins like which-key display
    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
    -- You can also use captures from other query groups like `locals.scm`
    ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
  }
end

function M.move()
  return {
	enable = true,
	set_jumps = true, -- whether to set jumps in the jumplist
	goto_next_start = {
	  ["]m"] = "@function.outer",
	  ["]]"] = "@class.outer",
	},
	goto_next_end = {
	  ["]M"] = "@function.outer",
	  ["]["] = "@class.outer",
	},
	goto_previous_start = {
	  ["[m"] = "@function.outer",
	  ["[["] = "@class.outer",
	},
	goto_previous_end = {
	  ["[M"] = "@function.outer",
	  ["[]"] = "@class.outer",
	},
  }
end

return M
