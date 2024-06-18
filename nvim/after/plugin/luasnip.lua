local status, luasnip = pcall(require, 'luasnip')
if (not status) then return end

local loaders = require("luasnip.loaders")

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

vim.keymap.set("n", "<leader>sn", loaders.edit_snippet_files, { silent = true })
