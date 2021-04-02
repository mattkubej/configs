--  https://github.com/neovim/neovim/pull/13479
local opt = vim.opt

--let mapleader = "\<Space>"
--filetype plugin on

opt.tabstop        = 2
opt.shiftwidth     = 2
opt.expandtab      = true
opt.autoindent     = true
opt.smartindent    = true
opt.cindent        = true
opt.hidden         = true
opt.relativenumber = true
opt.wrap           = false
opt.showmode       = false

opt.clipboard      = 'unnamedplus'
opt.laststatus     = 2

opt.undodir        = '~/.vimdid'
opt.undofile       = true

opt.tm             = 500

opt.incsearch      = true
opt.smartcase      = true

opt.termguicolors  = true
opt.number         = true
opt.colorcolumn    = 80
opt.t_vb           = ''
opt.belloff        = 'all'
