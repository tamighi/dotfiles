local status, harpoon = pcall(require, 'harpoon')
if (not status) then return end

harpoon:setup()

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, function() harpoon:list():select(i) end)
end
