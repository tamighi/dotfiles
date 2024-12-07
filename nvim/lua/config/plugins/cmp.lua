return {
  "hrsh7th/nvim-cmp",

  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind-nvim"
  },

  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'

    cmp.setup {
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
      }),

      mapping = {
        ['<C-k>'] = cmp.mapping(cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = false
        }), { "i", "c" }),

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
      },

      formatting = {
        format = lspkind.cmp_format()
      },

      experimental = {
        ghost_text = true
      },

      completion = {
        completeopt = 'menu,menuone,noinsert'
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },



      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
    }

    -- Remove duplicate path cmp for these filetypes
    cmp.setup.filetype({ 'typescriptreact', 'typescript' }, {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer',  keyword_length = 3 },
      }
    })
  end
}
