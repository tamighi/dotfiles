local status, dap = pcall(require, 'dap')
if (not status) then return end
local daptext = require("nvim-dap-virtual-text")
local dapui = require("dapui")

daptext.setup();
dapui.setup();

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.expand("$HOME") .. "/.local/share/nvim/mason/bin/codelldb",
    args = { "--port", "${port}" },

  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint);
vim.keymap.set("n", "<leader>dr", dap.continue);
vim.keymap.set("n", "<leader>dp", dap.pause);
vim.keymap.set("n", "<leader>do", dap.repl.open);
vim.keymap.set("n", "<leader>dd", dap.clear_breakpoints);
vim.keymap.set("n", "<leader>dt", dap.terminate);

vim.keymap.set("n", "<f1>", dap.step_into);
vim.keymap.set("n", "<f2>", dap.step_over);
vim.keymap.set("n", "<f3>", dap.step_out);
