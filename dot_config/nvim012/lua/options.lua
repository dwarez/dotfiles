local o = vim.opt

o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.termguicolors = true
o.background = "dark"

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true

o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.inccommand = "split"

o.splitright = true
o.splitbelow = true
o.scrolloff = 8
o.sidescrolloff = 8

o.undofile = true
o.swapfile = false
o.updatetime = 250
o.timeoutlen = 400

o.clipboard = "unnamedplus"
o.mouse = "a"
o.completeopt = "menu,menuone,noselect"
o.wrap = false
o.confirm = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- colorscheme prefs (picked up by colorscheme plugin)
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_foreground = "material"
