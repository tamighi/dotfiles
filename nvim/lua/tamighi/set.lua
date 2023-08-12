local opt = vim.opt

-- numbers
opt.nu = true
opt.relativenumber = true

-- backups
opt.swapfile = false
opt.backup = false

-- undos
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- ui
opt.title = true
opt.termguicolors = true
opt.cursorline = true
opt.colorcolumn = "80"

-- space tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.cindent = true
opt.expandtab = true
opt.smarttab = true

-- search
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true

-- display preferences
opt.scrolloff = 8
opt.wrap = false

-- syntax
opt.matchpairs:append("<:>")
opt.iskeyword:append("-")

-- leader key
vim.g.mapleader = " "

-- split
opt.splitright = true

-- clipboard to system
-- opt.clipboard = "unnamedplus"
