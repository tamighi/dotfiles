local status, cmp = pcall(require, 'cmp')
if (not status) then return end
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup({
  -- Snippet setup
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- Using buffer, lsp and snippets
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer',  keyword_length = 3 },
  }),

  -- Keymaps
  mapping = cmp.mapping.preset.insert({
    -- Scroll in cmp window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    -- Close mapping
    ['<C-e>'] = cmp.mapping.abort(),
    -- Open mapping
    ['<C-Space>'] = cmp.mapping.complete(),
    -- Confirm
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- Next/prev item
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
  }),
  -- Lspkind for icons
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[buf]",
        path = "[path]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        luasnip = "[snip]",
      }
    })
  },
  experimental = {
    ghost_text = true,
  }
})

-- Remove duplicate path cmp for these filetypes
cmp.setup.filetype({ 'typescriptreact', 'typescript' }, {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer',  keyword_length = 3 },
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
