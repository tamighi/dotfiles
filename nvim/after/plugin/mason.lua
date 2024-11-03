local status, mason = pcall(require, 'mason')
if (not status) then return end
local masonlsp = require('mason-lspconfig')

mason.setup()

masonlsp.setup({
  ensure_installed = {
    "ts_ls",
    "html",
    "cssls",
    "lua_ls",
    "jsonls",
    "tailwindcss",
    "clangd",
  }
})
