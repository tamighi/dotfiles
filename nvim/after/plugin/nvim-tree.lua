local status, api = pcall(require, "nvim-tree.api")
if (not status) then return end
local tree = require("nvim-tree")

tree.setup({
  hijack_netrw = false,
  git = {
    enable = false,
  },
  filters = {
    dotfiles = true,
    custom = { "node_modules", "dist", "build" }
  },
  view = {
    width = "100%",
  },
})

vim.keymap.set("n", "<leader>tr", function()
  api.tree.open()
  api.tree.expand_all()
end)
