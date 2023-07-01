local status, mark = pcall(require, 'harpoon.mark')
if (not status) then return end
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>hn', ui.nav_next)
vim.keymap.set('n', '<leader>hp', ui.nav_prev)
vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
