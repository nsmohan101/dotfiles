require("telescope").load_extension('harpoon')
require('telescope').setup({
    defaults = {
        preview = {
            treesitter = false,
        },
        mappings = {
            i = {
                ["<C-v>"] = "select_vertical",
                ["<C-h>"] = "select_horizontal"
            }
        }
    },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
    },
})

local builtin = require('telescope.builtin')

-- Search only in the current file
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzy search in current file' })


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>gl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', builtin.treesitter, { desc = 'Search document symbols (Treesitter)' })
vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, { desc = 'Search workspace symbols (LSP)' })
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Search in current file' })
vim.keymap.set('n', '<leader>gs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

