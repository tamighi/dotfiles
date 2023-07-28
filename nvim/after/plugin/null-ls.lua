--TODO: setup in LSP
local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local formatting = null_ls.builtins.formatting;

null_ls.setup({
  sources = {
    formatting.prettier,
    -- formatting.clang_format,
    -- python
    null_ls.builtins.formatting.black.with({
      extra_args = { "--line-length=120" }
    }),
    null_ls.builtins.formatting.isort,
  },
})

vim.keymap.set("n", "<leader>py", function() vim.lsp.buf.format { async = true } end)
