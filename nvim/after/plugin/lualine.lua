require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "rose-pine", -- if you use catppuccin, set theme = "catppuccin"
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" }, -- powerline wedges
    globalstatus = true,
    disabled_filetypes = { statusline = {}, winbar = {} },
  },

  sections = {
    -- Left side
    lualine_a = {
      {
        "mode",
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      },
    },
    lualine_b = {
      {
        "progress", -- "92%"
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      },
      {
        "location", -- "35:1"
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      },
    },
    lualine_c = {
      -- center can be empty (matches your screenshot vibe)
    },

    -- Right side
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = { error = "● ", warn = "● ", info = "● ", hint = "● " },
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      },
    },
    lualine_y = {
      {
        "filetype",
        icon_only = false,
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      },
    },
    lualine_z = {
      {
        function()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- cwd folder name
        end,
        icon = "",
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      },
    },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})

