local status, mason = pcall(require, 'mason')
if (not status) then return end
local masonlsp = require('mason-lspconfig')

mason.setup()

masonlsp.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "lua_ls",
    "jsonls",
    "pyright",
    "dockerls",
    "tailwindcss",
    "csharp_ls",
    "angularls",
    "clangd",
    "intelephense"
  }
})

local dap = require('dap')
local dap_text = require("nvim-dap-virtual-text")

dap.adapters.codelldb = {
  id = "codelldb",
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.exepath('codelldb'),
    args = { '--port', '${port}' },
  },
}

dap.configurations.cpp = {
  {
    name = "Debug using codelldb",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

vim.api.nvim_exec([[
    autocmd FileType dap-repl lua require('dap.ext.autocompl').attach()
]], false)

dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

dap_text.setup();

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint);
vim.keymap.set("n", "<leader>dr", dap.continue);
vim.keymap.set("n", "<leader>dp", dap.pause);
vim.keymap.set("n", "<leader>do", dap.repl.open);
vim.keymap.set("n", "<leader>dd", dap.clear_breakpoints);
vim.keymap.set("n", "<leader>dt", dap.terminate);

vim.keymap.set("n", "<f1>", dap.step_into);
vim.keymap.set("n", "<f2>", dap.step_over);
vim.keymap.set("n", "<f3>", dap.step_out);
