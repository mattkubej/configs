-- global functions must load first
require('mk.globals')

-- neovim options
require('mk.options')

--load plugins
require('mk.plugins')

-- load lsp
require("mk.lsp")

-- load keymaps
require("mk.mappings")
