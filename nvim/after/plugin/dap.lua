local status, dap = pcall(require, 'dap')
if (not status) then return end
local dap_text = require("nvim-dap-virtual-text")

-- TODO: Config & keymaps
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
