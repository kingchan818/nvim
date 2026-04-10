require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal window left" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal window down" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal window up" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal window right" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Git blame
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Git toggle line blame" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "Git diff this file" })
