local opt = vim.opt

-- numbers
opt.nu = true
opt.relativenumber = true

-- backups
opt.swapfile = false
opt.backup = false

-- ui
opt.cursorline = true

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
opt.ignorecase = true
opt.smartcase = true

-- display preferences
opt.scrolloff = 8
opt.wrap = false

-- syntax
opt.matchpairs:append("<:>")
opt.iskeyword:append("-")

-- split
opt.splitright = true

opt.clipboard = "unnamedplus"

vim.filetype.add {
  extension = {
    vert = "vert",
    frag = "frag",
  },
}
