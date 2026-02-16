vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set({ "n", "x" }, "x", '"_x')

vim.keymap.set("n", "<leader><Esc>", function()
	local config_path = vim.fn.stdpath("config") .. "/init.lua"
	vim.cmd("edit " .. config_path)
end, { desc = "Edit Neovim Configuration" })

-- Set CWD to the current buffer's directory
vim.keymap.set("n", "<leader>/", ":cd %:p:h<CR>:pwd<CR>", { desc = "Set CWD to current buffer" })

-- Comment
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true })

-- Buffer
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { silent = true, noremap = true, desc = "Delete current buffer" })

-- Move Items
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true })

-- Save (Ctrl + S)
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { silent = true })

-- Copy (Ctrl + C) in Visual Mode
vim.keymap.set("v", "<C-c>", '"+y', { silent = true })

-- Paste (Ctrl + V) in Insert Mode
vim.keymap.set("i", "<C-v>", "<C-r>+", { silent = true })

-- Continue selection in Visual Mode
vim.keymap.set("v", "<S-Up>", "<Up>", { silent = true })
vim.keymap.set("v", "<S-Down>", "<Down>", { silent = true })
vim.keymap.set("v", "<S-Left>", "<Left>", { silent = true })
vim.keymap.set("v", "<S-Right>", "<Right>", { silent = true })
vim.keymap.set("v", "<BS>", "d", { silent = true })

-- Split windows using Ctrl + h and Ctrl + v
vim.keymap.set("n", "<C-x>", "<cmd>split<cr>", { desc = "Split Horizontal" })
vim.keymap.set("n", "<C-y>", "<cmd>vsplit<cr>", { desc = "Split Vertical" })

-- Use Alt + arrows to resize windows
vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Navigate windows using Shift + Arrow keys
vim.keymap.set("n", "<S-Left>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<S-Down>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<S-Up>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<S-Right>", "<C-w>l", { desc = "Go to Right Window" })

-- Move window
vim.keymap.set("n", "<C-A-Left>", "<C-w>H", { desc = "Move Window Left" })
vim.keymap.set("n", "<C-A-Down>", "<C-w>J", { desc = "Move Window Down" })
vim.keymap.set("n", "<C-A-Up>", "<C-w>K", { desc = "Move Window Up" })
vim.keymap.set("n", "<C-A-Right>", "<C-w>L", { desc = "Move Window Right" })
