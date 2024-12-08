return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'

    telescope.setup {
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = { ".git/" }
        },
        help_tags = {
          mappings = {
            i = {
              ["<Enter>"] = "file_vsplit"
            }
          }
        }
      }
    }

    vim.keymap.set('n', '<leader>f', builtin.find_files, {})

    vim.keymap.set('n', '<leader>w', builtin.live_grep, {})
    vim.keymap.set("n", "<leader>k", builtin.keymaps, {})

    vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>p', builtin.resume, {})
  end
}
