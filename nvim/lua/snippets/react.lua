require("luasnip.session.snippet_collection").clear_snippets("typescriptreact")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local l = require("luasnip.extras").lambda

local fmt = require("luasnip.extras.fmt").fmt

ls.filetype_extend("typescriptreact", { "typescript" })

ls.add_snippets("typescriptreact", {
  s(
    "us",
    fmt("const [{}, set{setter}] = useState({})", {
      i(1, "state"),
      i(2, "initialValue"),
      setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1)
    })
  ),
  s(
    "ue",
    fmt([[
      useEffect(() => {{
        {2}
      }}, [{1}]
    ]], {
      i(1),
      i(2),
    })
  ),
})
