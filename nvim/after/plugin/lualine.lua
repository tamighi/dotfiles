local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "solarized_dark",
    component_separators = "|",
    section_separators = "",
    -- this removes print statement somehow
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "harpoon_files" },
    lualine_c = { "filename", "branch", "diff", "diagnostics" },
  },
})
