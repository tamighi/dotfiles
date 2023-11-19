require('lint').linters_by_ft = {
  typescript = {'eslint'},
  typescriptreact = {'eslint'},
}

vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
