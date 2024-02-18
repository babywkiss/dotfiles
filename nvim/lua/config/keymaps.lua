local keymap = vim.keymap.set

-- Leader Key
vim.g.mapleader = "," -- leader key

-- Search
keymap("", "<leader><space>", function() -- clear search
	vim.cmd("noh")
end, {})

-- Windows navigation
keymap("n", "J", "<C-w>j") -- move to bottom window
keymap("n", "K", "<C-w>k") -- move to top window
keymap("n", "H", "<C-w>h") -- move to left window
keymap("n", "L", "<C-w>l") -- move to right window

-- Buffers navigation
keymap("n", "<C-l>", function() -- move to next buffer
	vim.cmd("bnext")
end, {})
keymap("n", "<C-h>", function() -- move to prev buffer
	vim.cmd("bprev")
end, {})

-- Save buffer
keymap("n", "<leader>w", "<cmd>w<cr>")
