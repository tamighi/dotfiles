local status, ls = pcall(require, 'luasnip')
if (not status) then return end

require("luasnip.loaders.from_vscode").lazy_load()

-- Keymap
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })
