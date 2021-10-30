function load_config_cb(plugin)
  return function()
    require('mk.plugins.configs' .. plugin)
  end
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- nvim extensions
  use 'nvim-lua/plenary.nvim' -- helper lua functions
  use 'nvim-lua/popup.nvim' -- popup api for nvim

  -- text formatting
  use {
    'junegunn/vim-easy-align', -- text alignment
    config = load_config_cb('easyalign')
  }
  use 'tpope/vim-surround' -- surround text helpers

  -- git
  use 'junegunn/gv.vim' -- git commit browser
  use 'tpope/vim-fugitive' -- git wrapper
  use {
    'lewis6991/gitsigns.nvim', -- git signs
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = load_config_cb('gitsigns')
  }

  -- general language configuration
  use 'editorconfig/editorconfig-vim' -- EditorConfig plugin
  use {
    'neovim/nvim-lspconfig', -- common lsp configurations
    config = load_config_cb('lsp')
  }

  -- completion
  use {
    'hrsh7th/nvim-cmp', -- lsp auto completion
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim',
    },
    config = load_config_cb('cmp')
  }

  use {
    'terrortylor/nvim-comment',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    config = load_config_cb('nvim-comment')
  }
  use {"JoosepAlviste/nvim-ts-context-commentstring"}

  use 'jxnblk/vim-mdx-js' -- mdx highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = load_config_cb('treesitter')
  }
  use 'nvim-treesitter/playground'

  -- language specific plugins
  use 'fatih/vim-go' -- Go language support
  use 'kubejm/jest.nvim' -- jest test runner
  use 'mattn/emmet-vim' -- emmet shortcuts

  -- search/navigation
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
  use 'junegunn/fzf.vim'
  use {
    'nvim-lua/telescope.nvim', -- fuzzy finder and previewer
    config = load_config_cb('telescope')
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = load_config_cb('nvim-tree')
  }

  -- aesthetics
  use {
    'eddyekofo94/gruvbox-flat.nvim', -- gruvbox theme
    config = load_config_cb('gruvbox-flat')
  }
  use {
    'hoob3rt/lualine.nvim', -- statusline
    config = load_config_cb('lualine')
  }

  -- misc
  use {
    'vimwiki/vimwiki', -- wiki within vim
    config = load_config_cb('vimwiki')
  }
  use 'tpope/vim-unimpaired' -- common mappings

  -- possibly unmaintained
  use 'christoomey/vim-tmux-navigator' -- navigative between nvim and tmux
  use 'dag/vim-fish' -- fish script support

  -- testing
  use {
    'norcalli/nvim-colorizer.lua', -- highlight css colors
    config = load_config_cb('nvim-colorizer')
  }
  use {
    'windwp/nvim-autopairs',
    config = load_config_cb('nvim-autopairs')
  }
  use 'windwp/nvim-ts-autotag' -- auto-closing tags
  use 'tpope/vim-sleuth' -- auto adjust shiftwidth and expand tab
  use 'ray-x/lsp_signature.nvim' -- lsp signature help
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
end)
