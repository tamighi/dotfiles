local status, lint = pcall(require, 'lint')
if (not status) then return end

lint.linters_by_ft = {
  typescript = { 'eslint' },
  typescriptreact = { 'eslint' },
}

-- vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePost" }, {
--   callback = function()
--     lint.try_lint()
--   end,
-- })
