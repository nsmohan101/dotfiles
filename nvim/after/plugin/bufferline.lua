vim.opt.termguicolors = true
require("bufferline").setup({
    options = {
        numbers = "buffer_id",
        diagnostics = "coc",
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        separator_style = "padded_slope",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            }
        },
        indicator = {
            style = 'underline'
        }
    }
})
require("scope").setup {}
