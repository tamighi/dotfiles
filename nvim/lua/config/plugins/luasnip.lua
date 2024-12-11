return {
  "L3MON4D3/LuaSnip",

  config = function()
    local luasnip = require('luasnip')

    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })

    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
  end
}
