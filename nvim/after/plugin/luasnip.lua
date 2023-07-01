local status, ls = pcall(require, 'luasnip')
if (not status) then return end

-- JSON snippets
-- TODO: JSON to lua
require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets/json" })

-- Lua snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/lua" })

-- Keymap
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })
