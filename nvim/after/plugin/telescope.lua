local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local builtin = require('telescope.builtin')
local actions_state = require("telescope.actions.state")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

-- <C-/> in insert mode and ? in normal mode to see mappings
telescope.setup {
  extensions = {
    file_browser = {
      file_ignore_patterns = {},
      theme = "dropdown",
      hidden = true,
      grouped = true,
      previewer = false,
      hijack_netrw = true,
      layout_config = { height = 40 },
      mappings = {
        ["i"] = {
          ["<C-a>"] = function(prompt_bufnr)
            local path = actions_state.get_selected_entry(prompt_bufnr).value
            vim.fn.execute("cd " .. path, "silent")
            vim.cmd("Ex")
          end,
        },
      }
    },
  },
}

-- keymaps
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true, file_ignore_patterns = { ".git" } }) end,
  {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})

vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', builtin.resume, {})

-- File browser
vim.keymap.set("n", "<leader>fb", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
  })
end)

vim.keymap.set("n", "<leader>pv", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
  })
end)

telescope.load_extension("file_browser")
telescope.load_extension('fzf')
