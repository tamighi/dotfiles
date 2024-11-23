local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end
local lspkind = require('lspkind')
local cmp_lsp = require('cmp_nvim_lsp')

lspkind.init()

-- Called when language server attach to buffer (on_attach)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- Keymaps
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next)

    if client.name == "ts_ls" then
      vim.keymap.set("n", "<leader>oi", ":OrganizeImports<CR>")
    end
  end,
})

-- Language server setup

-- capabilities = autocomplete
local capabilities = cmp_lsp.default_capabilities()


-- Typescript
--
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.ts_ls.setup {
  server = {
    capabilities = capabilities
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}

-- Angular
lspconfig.angularls.setup {
  capabilities = capabilities
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
  capabilities = capabilities,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    }
  }
}

-- Php
lspconfig.intelephense.setup {
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

-- Cpp
lspconfig.clangd.setup {
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

-- LaTex
lspconfig.texlab.setup {}

capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "html", "typescriptreact" },
})
