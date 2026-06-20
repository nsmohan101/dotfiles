require("neo-tree").setup({
  close_if_last_window = false,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  enable_normal_mode_for_inputs = false,
  open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
  sort_case_insensitive = false,
  sort_function = nil,

  source_selector = {
    winbar = true,
    statusline = true,
  },

  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰜌",
      default = "",
    },
    kind_icon = {
      FolderClosed = "",
      FolderOpen = "",
      File = "",
      Modified = "●",
      SymbolicLinkTarget = "󰉒",

      Class = "󰠱",
      Constant = "󰏿",
      Constructor = "󰆧",
      Enum = "󰒻",
      EnumMember = "󰒻",
      Event = "󰉁",
      Field = "󰜢",
      Function = "󰊕",
      Interface = "󰕘",
      Key = "󰌋",
      Method = "󰆧",
      Module = "󰏗",
      Namespace = "󰌗",
      Number = "󰎠",
      Object = "󰅩",
      Operator = "󰆕",
      Package = "󰏖",
      Property = "󰜢",
      String = "󰀬",
      Struct = "󰌗",
      TypeParameter = "󰊄",
      Variable = "󰀫",
      Boolean = "󰨙",
      Array = "󰅪",
    },
  },

  filesystem = {
    follow_current_file = { enabled = true },
    filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = false,
      hide_hidden = true,
      hide_by_pattern = {
        "build",
      },
    },
  },

  window = {
    mappings = {
      ["|"] = "open_vsplit",
      ["-"] = "open_split",
      ["<S-H>"] = "prev_source",
      ["<S-L>"] = "next_source",
    },
  },
})
