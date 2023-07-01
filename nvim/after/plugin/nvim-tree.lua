local api = require("nvim-tree.api")

require("nvim-tree").setup({
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
