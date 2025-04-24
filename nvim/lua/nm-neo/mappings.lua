-- Leader Key --
vim.g.mapleader= " "

-- Bring tree up from --
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cs", vim.cmd.nohl)

----------------------------- Editor Settings ----------------------------------

-- Relative Number --
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set Tabs to 4 Spaces --
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smartindent = true

-- Don't Wrap Text --
vim.opt.wrap = false
vim.opt.cursorline = true

-- Highlight searches and incremental search --
vim.opt.hlsearch  = true
vim.opt.incsearch = true

-- Colors ---
vim.opt.termguicolors = true

-- Always have 4 spaces down --
vim.opt.scrolloff  = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Draw line at 120 --
vim.opt.colorcolumn = "120"

-- Lower default Update time --##
vim.opt.updatetime = 50

----------------------------- Editor Key Maps ----------------------------------

-- Remap Copy, Cut and Paste to Clipboard --
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set('n', '<leader>p', '"+gP')

-- Power of Move --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor Settings --
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserve Copy --
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)



