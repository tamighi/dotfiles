local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Helpers for writing snippets
  s({
    trig = "s",
    name = "New snippet",
    dscr = "Make a new lua snippet (this is not recursive)"
  }, {
    t({"s({", "\ttrig = \""}),
    i(1, "trigger"),
    t({"\",", "\tname = \""}),
    i(2, "name"),
    t({"\",", "\tdscr = \""}),
    i(3, "description"),
    t({"\"", "},", "{", "\t"}),
    i(0),
    t({"", "})"})
  }),
  s({
    trig = "t",
    name = "Text snippet",
    dscr = "Add snippet text"
  }, {
    t("t(\""), i(0, "text"), t("\")")
  }),
  s({
    trig = "tln",
    name = "Text snippet",
    dscr = "Add snippet text"
  }, {
    t({"t({\""}), i(0, "text"), t({"\"})"})
  }),
  s({
    trig = "i",
    name = "Insert snippet",
    dscr = "Add snippet insert"
  },
  {
    t("i("), i(0, "0"), t(")")
  }),

  -- Nvim Helpers
  s({
    trig = "vks",
    name = "Set keymap",
    dscr = "Set a keymap with vim.keymap.set"
  },
  {
    t("vim.keymap.set("),
    i(1, "\"mode\""),
    t(", "),
    i(2, "\"key\""),
    t(", "),
    i(0, "\"cmd\""),
    t(");")
  })
}
