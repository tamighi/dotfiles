local status, conform = pcall(require, 'conform')
if (not status) then return end

local format_options = {
  lsp_fallback = true
}

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
  },
  format_on_save = format_options
})

vim.keymap.set({ "n", "v" }, "<leader>py",
  function()
    conform.format(format_options);
  end
)
