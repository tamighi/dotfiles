local zenMode = require('zen-mode')

zenMode.setup {
}

vim.keymap.set('n', '<C-z>', '<cmd>ZenMode<cr>', { silent = true })
