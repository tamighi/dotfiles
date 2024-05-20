local status, cmp = pcall(require, 'cmp')
if (not status) then return end

-- lspkind
local lspkind = require('lspkind')
lspkind.init {}

local luasnip = require('luasnip')

vim.opt.completeopt = { "noselect", "menu", "menuone" }

-- cmp
cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  }),

  mapping = {
    ['<C-y>'] = cmp.mapping(cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }), { "i", "c" }),

    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
})

-- luasnip
luasnip.config.set_config {
  history = false,
  updateevent = "TextChanged,TextChanged1"
}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
  loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })
