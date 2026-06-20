local wk = require("which-key")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

-- Leader Key --
vim.g.mapleader= " "

local wrap = function(func, ...)
  local args = {...}
  return function()
    func(unpack(args))
  end
end

local template = vim.api.nvim_create_augroup("templates", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {

    pattern = "*.py",
    command = "0r ~/.config/nvim/templates/python.py",
    group = template

})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.cpp", "*.c", "*.cc"},
    command = "0r ~/.config/nvim/templates/c_cpp_temp.c",
    group = template

})


vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.hpp", "*.h"},
    command = "0r ~/.config/nvim/templates/c_cpp_temp.h",
    group = template

})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.sh",
    command = "0r ~/.config/nvim//templates/bash.sh",
    group = template

})

-- Bring tree up from --
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cs", vim.cmd.nohl)
vim.keymap.set("n", "<S-L>", vim.cmd.bnext)
vim.keymap.set("n", "<S-H>", vim.cmd.bprev)

vim.keymap.set("n", "<leader>et", '<Cmd>Neotree toggle<CR>')
vim.keymap.set("n", "<leader>mk", '<Cmd>MarkdownPreviewToggle<CR>')
vim.keymap.set("n", "<leader><CR>", '<Cmd>AerialToggle!<CR>')
vim.keymap.set("n", "<leader>vsz", '<Cmd>vertical resize 130<CR>')
vim.keymap.set("n", "<leader><leader>h", vim.cmd.WhichKey)
vim.keymap.set("n", "<leader>es", '<Cmd>Trouble diagnostics toggle<CR>')
vim.keymap.set("n", "<leader>ef", '<Cmd> lua vim.lsp.buf.code_action()<CR>')

vim.keymap.set("n", "<M-UP>", "<Cmd> res +2<CR>")
vim.keymap.set("n", "<M-DOWN>", "<Cmd> res -2<CR>")
vim.keymap.set("n", "<M-RIGHT>", "<Cmd> vertical res +2<CR>")
vim.keymap.set("n", "<M-LEFT>", "<Cmd> vertical res -2<CR>")

vim.keymap.set("n", "<leader>funcc", "<Cmd> -1read $HOME/.config/nvim/templates/cppFunc_void.cpp<CR>")
vim.keymap.set("n", "<leader>funcd", "<Cmd> -1read $HOME/.config/nvim/templates/func_doxy.c<CR>")
vim.keymap.set("n", "<leader>cmb1", "<Cmd> -1read $HOME/.config/nvim/templates/comm_block_1.c<CR>")
vim.keymap.set("n", "<leader>cmb2", "<Cmd> -1read $HOME/.config/nvim/templates/comm_block_2.c<CR>")
vim.keymap.set("n", "<leader>lc", "<Cmd> -1read $HOME/.config/nvim/templates/c_cpp_temp.c<CR>")
vim.keymap.set("n", "<leader>lpy", "<Cmd> -1read $HOME/.config/nvim/templates/python.py<CR>")
vim.keymap.set("n", "<leader>lh", "<Cmd> -1read $HOME/.config/nvim/templates/c_cpp_temp.h<CR>")
vim.keymap.set("n", "<leader>lsh", "<Cmd> -1read $HOME/.config/nvim/templates/bash.sh<CR>")

vim.fn.setreg('c', 'i//viwS/lli  iq€kb')

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.bb", "*.bbappend", "*.bbclass", "*.inc", "conf/*.conf" },
  callback = function()
    vim.lsp.start({
      name = "bitbake",
      cmd = { "bitbake-language-server" }
    })
  end,
})

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
vim.keymap.set({"n", "v"}, "cc", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set('n', 'cv', '"+gP')

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
vim.keymap.set("x", "<leader>P", [["_dP]])

-- Format Text -- 
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format)

-- Substitute and chmod+x commands --
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { silent = true })


-- Terminal Emulator key mappings --
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- harpoon
vim.keymap.set('n', '<leader>hx', require('harpoon.mark').add_file)
vim.keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next)
vim.keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev)
vim.keymap.set('n', '<leader>hm', require('harpoon.ui').toggle_quick_menu)
vim.keymap.set('n', '<leader>ht1', function() term.gotoTerminal(1) end)
vim.keymap.set('n', '<leader>ht2', function() term.gotoTerminal(2) end)
vim.keymap.set('n', '<leader>ht3', function() term.gotoTerminal(3) end)
vim.keymap.set('n', '<leader>ht4', function() term.gotoTerminal(4) end)
vim.keymap.set('n', '<leader>ht5', function() term.gotoTerminal(5) end)
vim.keymap.set('n', '<leader>ht6', function() term.gotoTerminal(6) end)
vim.keymap.set('n', '<leader>ht7', function() term.gotoTerminal(7) end)
vim.keymap.set('n', '<leader>ht8', function() term.gotoTerminal(8) end)
vim.keymap.set('n', '<leader>ht9', function() term.gotoTerminal(9) end)
vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>h5', function() ui.nav_file(5) end)
vim.keymap.set('n', '<leader>h6', function() ui.nav_file(6) end)
vim.keymap.set('n', '<leader>h7', function() ui.nav_file(7) end)
vim.keymap.set('n', '<leader>h8', function() ui.nav_file(8) end)
vim.keymap.set('n', '<leader>h9', function() ui.nav_file(9) end)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- Diff Key bindings --##
vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>")
vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory %<CR>")
vim.keymap.set("n", "<leader>dH", "<cmd>DiffviewFileHistory<CR>")
vim.keymap.set("n", "<leader>do", ":diffoff!<CR>")



-- Harpoon Which-key mappings
wk.register({
    -- The first key you are pressing
    h = {
        name = "harpoon",
        -- the second key
        x    = { function()
            require('harpoon.mark').add_file()
        end, "Mark file" }
    },
}, { prefix = "<leader>" })



function CenterBlockComment()
  local line_nr = vim.fn.line(".")
  local line = vim.fn.getline(line_nr)

  -- Match: /    optional text     /
  local prefix, text, suffix = line:match("^(%s*/)%s*(.-)%s*(/)%s*$")
  if not prefix or not suffix then
    print("Couldn't parse line.")
    return
  end

  text = vim.trim(text)

  local total_width = #line
  local inner_width = total_width - #prefix - #suffix

  local left_pad = math.floor((inner_width - #text) / 2)
  local right_pad = inner_width - #text - left_pad

  local centered = prefix .. string.rep(" ", left_pad) .. text .. string.rep(" ", right_pad) .. suffix
  vim.fn.setline(line_nr, centered)
end

-- Center text in block --
vim.keymap.set("n", "<leader>ct", CenterBlockComment, { desc = "Center block comment text" })


