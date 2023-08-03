local status, ls = pcall(require, 'luasnip')
if (not status) then return end
local loaders = require("luasnip.loaders")

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

--ls.filetype_extend("php", { "html" })

-- Keymap
vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set("n", "<leader>sn", loaders.edit_snippet_files, { silent = true })
