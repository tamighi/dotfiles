return {
  "tpope/vim-fugitive",

  config = function()
    vim.keymap.set("n", "<leader>gg", vim.cmd.Git);
    vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>");
    vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>");
    vim.keymap.set("n", "<leader>gl", "<cmd>Git log --oneline<cr>");
    vim.keymap.set("n", "<leader>gm", "<cmd>Git mergetool<cr>");
  end
}
