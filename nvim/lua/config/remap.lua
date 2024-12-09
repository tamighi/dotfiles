local keymap = vim.keymap

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

-- Fast save
keymap.set("n", "<C-s>", ":w<Cr>")

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Section jump
keymap.set("n", "[[", "?{<CR>")
keymap.set("n", "]]", "/{<CR>")

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
