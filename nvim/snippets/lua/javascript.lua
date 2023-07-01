local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Console
  s({
    trig = "cl",
    name = "console log",
    dscr = "Log in console"
  },
    {
      t("console.log("), i(0), t(")")
    }),
  -- Async snippets
  s({
    trig = "a",
    name = "await",
    dscr = "await keyword"
  }, {
    t("await "), i(0)
  }),
  s({
    trig = "asl",
    name = "await sleep",
    dscr = "Await a timeout promise (sleep)"
  },
    {
      t("await new Promise((r) => setTimeout(r, "), i(0, "1000"), t("))")
    }),
  s({
    trig = "P",
    name = "promise",
    dscr = "Promise type"
  },
    {
      t("Promise")
    }),
  -- Event listeners
  s({
    trig = "ael",
    name = "addEventListener",
    dscr = "Add an event listener"
  },
    {
      i(1),
      t(".addEventListener('"),
      i(2, "event"),
      t("', "),
      i(3, "ev"),
      t({ " => {", "\t" }),
      i(0),
      t({ "", "})" })
    }),
  s({
    trig = "rel",
    name = "removeEventListener",
    dscr = "Remove an event listener"
  },
    {
      i(1, "document"),
      t(".removeEventListener('"),
      i(2, "event"),
      t("', "),
      i(0, "listener"),
      t(")")
    }),
  -- Document element
  s({
    trig = "gi",
    name = "getElementById",
    dscr = "Get an element by id",
  }, {
    i(1, "document"),
    t(".getElementById('"),
    i(2, "id"),
    t("')")
  }),
  -- Array functions
  s({
    trig = "fe",
    name = "forEach loop",
    dscr = "Create a for each loop on an object"
  },
    {
      i(1, "iterable"),
      t(".forEach(("),
      i(2, "item"),
      t({ ") => {", "\t" }),
      i(0),
      t({ "", "})" })
    }),
  s({
    trig = "map",
    name = "map",
    dscr = "Create a map on an object",
  }, {
    i(1, "iterable"),
    t(".map(("),
    i(2, "item"),
    t({ ") => {", "\t" }),
    i(0),
    t({ "", "})" })
  }),
  s({
    trig = "reduce",
    name = "reduce",
    dscr = "Create a reduce on an object",
  }, {
    i(1, "iterable"),
    t(".reduce(("),
    i(2, "previous"),
    t(", "),
    i(3, "current"),
    t({ ") => {", "\t" }),
    i(0),
    t({ "", "})", ", initial" })
  }),
  s({
    trig = "filter",
    name = "filter",
    dscr = "Create a filter on an object",
  }, {
    i(1, "iterable"),
    t(".filter(("),
    i(2, "item"),
    t({ ") => {", "\t" }),
    i(0),
    t({ "", "})" })
  }),
  s({
    trig = "find",
    name = "find",
    dscr = "Find an element in an object",
  }, {
    i(1, "iterable"),
    t(".find(("),
    i(2, "item"),
    t({ ") => {", "\t" }),
    i(0),
    t({ "", "})" })
  }),
  s({
    trig = "every",
    name = "every",
    dscr = "Check if all elements in an object pass a test",
  }, {
    i(1, "iterable"),
    t(".every(("),
    i(2, "item"),
    t({ ") => {", "\t" }),
    i(0),
    t({ "", "})" })
  }),
  s({
    trig = "some",
    name = "some",
    dscr = "Check if some elements in an object pass a test",
  }, {
    i(1, "iterable"),
    t(".some(("),
    i(2, "item"),
    t({ ") => {", "\t" }),
    i(0),
    t({ "", "})" })
  })
}
