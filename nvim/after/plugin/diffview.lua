require("diffview").setup({
  enhanced_diff_hl = true,   -- Better word-level diff highlight
  use_icons = true,          -- File status icons (if you use nerd fonts)

  view = {
    default = {
      layout = "diff2_horizontal", -- Most BC-like experience
    },
    merge_tool = {
      layout = "diff3_horizontal",
      disable_diagnostics = true,  -- Prevent LSP noise during merge
    },
  },

  file_panel = {
    listing_style = "tree",
    win_config = {
      position = "left",
      width = 35
    }
  },
})

