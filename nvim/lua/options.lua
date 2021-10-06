local vim = vim
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "no"
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 400
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.whichwrap:append("<>hl")
opt.pumheight = 20
opt.foldmethod = "manual"
opt.list = true
opt.smartindent = true
opt.expandtab = true
opt.syntax = "on"
opt.shiftwidth = 4
opt.tabstop = 4
opt.virtualedit = ""
opt.number = true
opt.relativenumber = true

g.mapleader = " "
g.auto_save = 0
g.backspace = "eol,start,indent"
g.whichwrap = "<,>,h,l"
g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

g.indent_blankline_filetype_exclude = { "help", "terminal" }
g.indent_blankline_buftype_exclude = { "terminal" }

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

cmd("set tm=2000")
cmd("set smarttab")
cmd("set noswapfile")

opt.background = "dark"
g.tokyonight_transparent_sidebar = true
g.tokyonight_transparent = true
cmd("colorscheme tokyonight")
