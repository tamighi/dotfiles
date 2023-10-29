local status, mason = pcall(require, 'mason')
if (not status) then return end
local masonlsp = require('mason-lspconfig')
local masondap = require("mason-nvim-dap")

mason.setup()

masondap.setup({ handlers = {} })

masonlsp.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "lua_ls",
    "jsonls",
    "pyright",
    "dockerls",
    "tailwindcss",
    "csharp_ls",
    "angularls",
    "clangd",
    "intelephense"
  }
})
