return {
  "windwp/nvim-autopairs",

  config = function()
    local autopairs = require('nvim-autopairs')

    autopairs.setup({
      disable_filetype = { "TelescopePrompt", "vim" },
      enable_bracket_in_quote = false,
      check_ts = true,
      ts_config = {
        lua = false,
        javascript = { 'template_string' },
      }
    })
  end
}
