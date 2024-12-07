return {
  "stevearc/conform.nvim",

  config = function()
    local conform = require 'conform'
    local format_options = {
      lsp_fallback = true,
      async = false
    }

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
      format_on_save = format_options
    })
  end
}
