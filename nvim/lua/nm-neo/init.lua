require("nm-neo.plugins")
require("nm-neo.mappings")
require("nm-neo.utils")

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"

local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.undofile = true
vim.opt.undodir = undodir
