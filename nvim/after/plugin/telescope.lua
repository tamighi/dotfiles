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
      theme = "dropdown",
      --hijack_netrw = true,
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
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
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>td', function() builtin.grep_string({ prompt_title = "TODOS", search = "TODO" }) end, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set("n", "<leader>er", builtin.diagnostics, {})

vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})
vim.keymap.set('n', '<leader>;', builtin.resume, {})

-- File browser
vim.keymap.set("n", "<leader>br", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
  })
end)

telescope.load_extension("file_browser")
telescope.load_extension('fzf')
