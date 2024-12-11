return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },

  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local multigrep = require 'config.telescope.multigrep'

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
        },
        extensions = {
          fzf = {}
        }
      }
    }

    vim.keymap.set('n', '<leader>fd', builtin.find_files)
    vim.keymap.set("n", "<leader>fk", builtin.keymaps)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags)
    vim.keymap.set('n', '<leader>fp', builtin.resume)

    vim.keymap.set('n', '<leader>en',
      function()
        builtin.find_files { cwd = vim.fn.stdpath("config") }
      end, {})

    vim.keymap.set('n', '<leader>fg', multigrep.live_multigrep)
  end
}
