--TODO: setup in LSP
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting;

null_ls.setup({
  sources = {
    formatting.prettier,
    -- python
    null_ls.builtins.formatting.black.with({
      extra_args = { "--line-length=120" }
    }),
    null_ls.builtins.formatting.isort,
  },
})

vim.keymap.set("n", "<leader>py", vim.lsp.buf.format)
