return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },

  config = function()
    local lspconfig = require 'lspconfig'

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

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
      }
      vim.lsp.buf.execute_command(params)
    end

    lspconfig.ts_ls.setup {
      commands = {
        OrganizeImports = { organize_imports }
      }
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.html.setup {
      capabilities = capabilities
    }

    lspconfig.cssls.setup {
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore"
          }
        }
      }
    }

    lspconfig.emmet_ls.setup {}

    lspconfig.jsonls.setup {}

    lspconfig.tailwindcss.setup {}

    lspconfig.clangd.setup {}

    lspconfig.lua_ls.setup {
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
  end
}
