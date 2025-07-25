return {
  "L3MON4D3/LuaSnip",

  config = function()
    local luasnip = require('luasnip')
    local loader = require('luasnip.loaders')

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

    vim.keymap.set("n", "<leader>es", loader.edit_snippet_files, { silent = true })

    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
  end
}
