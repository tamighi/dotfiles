return {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "williamboman/mason.nvim",
  },

  config = function()
    local mason = require 'mason'
    local mason_lsp = require 'mason-lspconfig'

    mason.setup()
    mason_lsp.setup {
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "lua_ls",
        "jsonls",
        "tailwindcss",
        "clangd"
      }
    }
  end
}
