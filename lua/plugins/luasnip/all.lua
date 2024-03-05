local ls = require("luasnip")
local s, f, i = ls.snippet, ls.function_node, ls.insert_node

return {
  s("today.iso", {
    f(
      function(_, _) return os.date("%Y-%m-%d") end, {}
    )
  })
}
