local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local builtin = require('telescope.builtin')

-- <C-/> in insert mode and ? in normal mode to see mappings
telescope.setup {}

-- keymaps
vim.keymap.set('n', '<leader>f', function()
  builtin.find_files({
    hidden = true,
  })
end, {})

vim.keymap.set('n', '<leader>w', builtin.live_grep, {})
vim.keymap.set("n", "<leader>k", builtin.keymaps, {})

vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>p', builtin.resume, {})

telescope.load_extension('fzf')
