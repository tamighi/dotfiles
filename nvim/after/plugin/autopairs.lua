local autopairs = require('nvim-autopairs')

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
  enable_bracket_in_quote = false,
  --[[ check_ts = true,
  ts_config = {
    lua = {'string'}
  } ]]
})
