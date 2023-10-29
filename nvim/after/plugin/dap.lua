local status, dap = pcall(require, 'dap')
if (not status) then return end

vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end);
vim.keymap.set("n", "<leader>dr", function() dap.continue() end);
vim.keymap.set("n", "<leader>dp", function() dap.pause() end);
vim.keymap.set("n", "<leader>do", function() dap.repl.open() end);
