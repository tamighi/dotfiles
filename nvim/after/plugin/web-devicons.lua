local icons = require('nvim-web-devicons')

icons.setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override_by_filename = {
  },
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true
}
