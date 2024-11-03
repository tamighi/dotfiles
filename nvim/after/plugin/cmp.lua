local status, cmp = pcall(require, 'cmp')
if (not status) then return end

-- lspkind
local lspkind = require('lspkind')
local luasnip = require('luasnip')

-- cmp
cmp.setup({
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
    format = lspkind.cmp_format({
      menu = {
        buffer = "[buf]",
        path = "[path]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        luasnip = "[snip]",
      }
    })
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
})

-- Remove duplicate path cmp for these filetypes
cmp.setup.filetype({ 'typescriptreact', 'typescript' }, {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer',  keyword_length = 3 },
  }
})
