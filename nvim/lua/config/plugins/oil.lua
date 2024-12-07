return {
  "stevearc/oil.nvim",

  config = function()
    local oil = require 'oil'

    oil.setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      columns = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-c>"] = false,
      },
      view_options = {
        show_hidden = true
      }
    })

    vim.keymap.set("n", "<leader>b", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end
}
