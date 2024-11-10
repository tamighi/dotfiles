local keymap = vim.keymap

-- Window centered when scroll
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Reposition window on go to next
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- No yank for x
keymap.set("n", "x", '"_x')

-- Copy to clipboard
keymap.set("v", "<C-c>", "\"+y")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Window split
keymap.set("n", "<C-w>v", "<C-w>v<C-w>l")

-- Fast quit
keymap.set("n", "<C-c>", ":x<Cr>")

-- Fast save
keymap.set("n", "<C-s>", ":w<Cr>")

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Section jump
keymap.set("n", "[[", "?{<CR>")
keymap.set("n", "]]", "/{<CR>")

keymap.set("n", "][", "?}<CR>")
keymap.set("n", "[]", "/}<CR>")

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
