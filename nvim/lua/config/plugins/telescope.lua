return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'

    telescope.setup {}

    vim.keymap.set('n', '<leader>f', function()
      builtin.find_files({
        hidden = true,
        file_ignore_patterns = { ".git/" }
      })
    end, {})

    vim.keymap.set('n', '<leader>w', builtin.live_grep, {})
    vim.keymap.set("n", "<leader>k", builtin.keymaps, {})

    vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>p', builtin.resume, {})
  end
}
