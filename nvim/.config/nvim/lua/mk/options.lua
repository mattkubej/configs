--  https://github.com/neovim/neovim/pull/13479
local opt = vim.opt

opt.hidden         = true
opt.relativenumber = true
opt.showmode       = false
opt.updatetime     = 1000
opt.hlsearch       = false
opt.scrolloff      = 10

opt.autoindent     = true
opt.cindent        = true
opt.smartindent    = true

opt.expandtab      = true
opt.shiftwidth     = 2
opt.softtabstop    = 2
opt.tabstop        = 2

opt.clipboard      = 'unnamedplus'
opt.laststatus     = 2

opt.undodir        = '~/.vimdid'
opt.undofile       = true
opt.swapfile       = false
opt.inccommand     = 'split'

opt.tm             = 500

opt.incsearch      = true
opt.smartcase      = true

opt.termguicolors  = true
opt.number         = true
opt.colorcolumn    = 80
opt.t_vb           = ''
opt.belloff        = 'all'

-- trying out new wrapping
opt.wrap           = true
opt.breakindent    = true
opt.showbreak      = string.rep(' ', 3)
opt.linebreak      = true

opt.foldmethod     = 'marker'
opt.foldlevel      = 0
opt.modelines      = 1

opt.joinspaces     = false

opt.formatoptions  = opt.formatoptions
                     - '2'
                     - 'a'
                     - 'o'
                     - 't'
                     + 'c'
                     + 'j'
                     + 'n'
                     + 'q'
                     + 'r'
