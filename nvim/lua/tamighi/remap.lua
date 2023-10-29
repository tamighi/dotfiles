local keymap = vim.keymap

-- Back to file browser
keymap.set("n", "<leader>pv", "<cmd>Ex<CR>");

-- Move blocks of line in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Window centered when scroll
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Reposition window on go to next
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- No yank for x
keymap.set("n", "x", '"_x')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Window split
keymap.set("n", "<C-w>v", "<C-w>v<C-w>l")

-- Fast quit
keymap.set("n", "<C-c>", ":q<Cr>")

-- nohl
keymap.set("n", "<leader><Cr>", ":nohl<Cr>")

-- Section jump
keymap.set("n", "[[", "?{<CR>")
keymap.set("n", "]]", "/{<CR>")

keymap.set("n", "][", "?}<CR>")
keymap.set("n", "[]", "/}<CR>")

-- Copy to clipboard
keymap.set("v", "<C-y>", "\"+y")
