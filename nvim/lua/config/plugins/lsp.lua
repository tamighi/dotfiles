return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  config = function()
    local lspconfig = require 'lspconfig'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- Keymaps
        vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
        vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)

        if client ~= nil and client.name == "ts_ls" then
          vim.keymap.set("n", "<leader>oi", ":OrganizeImports<CR>")
        end
      end,
    })

    local cmp_lsp = require("cmp_nvim_lsp");
    local capabilities = cmp_lsp.default_capabilities();

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
      }
      vim.lsp.buf.execute_command(params)
    end

    lspconfig.ts_ls.setup {
      capabilities = capabilities,
      commands = {
        OrganizeImports = { organize_imports }
      }
    }


    lspconfig.html.setup {}

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

    lspconfig.emmet_ls.setup {
      init_options = {
        html = {
          options = {
            ["output.compactBoolean"] = true,
          },
        },
      }
    }

    lspconfig.jsonls.setup {}

    lspconfig.tailwindcss.setup {}

    lspconfig.clangd.setup {}

    lspconfig.lua_ls.setup {}
  end
}
