local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Header (pick your poison 🍜)
dashboard.section.header.val = {
  "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
  "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
  "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
  "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
  "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
  "",
  "      ⚡  N E O V I M   L A U N C H P A D  ⚡",
  "",
}

-- Helpers: Git repo + branch
local function git_info()
  local cwd = vim.fn.getcwd()
  local git_dir = vim.fn.finddir(".git", cwd .. ";")
  if git_dir == "" then
    return nil
  end

  local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1] or ""
  local top = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1] or ""
  if top == "" then
    return nil
  end

  local repo = vim.fn.fnamemodify(top, ":t")
  if branch == "" then
    return repo
  end
  return repo .. "   " .. branch
end

local function nvim_version()
  local v = vim.version()
  return string.format("NVIM v%d.%d.%d", v.major, v.minor, v.patch)
end

-- Buttons
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("g", "  Live grep", ":Telescope live_grep<CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("n", "  New file", ":enew<CR>"),
  dashboard.button("p", "󰏗  Plugins", ":PackerStatus<CR>"),
  dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Footer
dashboard.section.footer.val = function()
  local lines = {}
  table.insert(lines, "")
  local gi = git_info()
  if gi then
    table.insert(lines, "  " .. gi)
  else
    table.insert(lines, "  (not in a git repo)")
  end
  table.insert(lines, "  " .. nvim_version())
  return lines
end

-- Make it look less cramped
dashboard.config.layout[1].val = 2
dashboard.config.layout[3].val = 2

-- Optional: a little highlight polish
dashboard.section.header.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Comment"

return dashboard

