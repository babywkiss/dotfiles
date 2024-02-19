local opt = vim.opt

-- Options
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.ruler = false
opt.numberwidth = 2
opt.number = true
opt.relativenumber = true

-- Misc
opt.cmdheight = 0 --do not show default status line in normal mode
opt.shortmess:append("sI") -- disable nvim intro
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.wrap = false -- long lines do not wrapping on new line
opt.scrolloff = 7 -- autscroll before line end
opt.encoding = "utf-8" -- fileformat default
opt.fileformat = "unix" -- fileformat default

opt.updatetime = 250
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
