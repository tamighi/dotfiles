local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end
local cmp_lsp = require('cmp_nvim_lsp')
local typescript = require('typescript')

-- Called when language server attach to buffer (on_attach)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- Keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next)

    if client.name == "tsserver" then
      vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
      vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>")
    end

    -- Format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = ev.buf,
        callback = function() vim.lsp.buf.format() end
      })
    end
  end,
})

-- Language server setup
-- capabilities = autocomplete
local lsp_default = lspconfig.util.default_config
local capabilities = cmp_lsp.default_capabilities(lsp_default.capabilities)

-- Typescript with the ts plugin
typescript.setup {
  server = {
    capabilities = capabilities,
    on_attach = function(client)
      client.server_capabilities.document_formatting = false
    end,
  }
}

-- Python
lspconfig.pyright.setup {
  capabilities = capabilities
}

-- Html
lspconfig.html.setup {
  capabilities = capabilities
}

-- Css
lspconfig.cssls.setup {
  capabilities = capabilities
}

-- Json
lspconfig.jsonls.setup {
  capabilities = capabilities
}

-- Docker
lspconfig.dockerls.setup {
  capabilities = capabilities
}

-- Tailwind
lspconfig.tailwindcss.setup {
  capabilities = capabilities
}

-- Lua
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true)
    },
  }
}
