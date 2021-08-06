return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- nvim extensions
  use 'nvim-lua/plenary.nvim' -- helper lua functions
  use 'nvim-lua/popup.nvim' -- popup api for nvim

  -- text formatting
  use 'junegunn/vim-easy-align' -- text alignment
  use 'tpope/vim-surround' -- surround text helpers

  -- git
  use 'junegunn/gv.vim' -- git commit browser
  use 'tpope/vim-fugitive' -- git wrapper
  use { -- git signs
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- general language configuration
  use 'editorconfig/editorconfig-vim' -- EditorConfig plugin
  use 'neovim/nvim-lspconfig' -- common lsp configurations
  use 'hrsh7th/nvim-compe' -- lsp completion
  use 'scrooloose/nerdcommenter' -- comment functions
  use 'jxnblk/vim-mdx-js' -- mdx highlighting
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'

  -- language specific plugins
  use 'fatih/vim-go' -- Go language support
  use 'kubejm/jest.nvim' -- jest test runner
  use 'mattn/emmet-vim' -- emmet shortcuts
  use 'mhartington/formatter.nvim' -- formatting

  -- search/navigation
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
  use 'junegunn/fzf.vim'
  use 'nvim-lua/telescope.nvim' -- fuzzy finder and previewer
  use 'scrooloose/nerdtree' -- file explorer

  -- aesthetics
  use 'eddyekofo94/gruvbox-flat.nvim' -- gruvbox theme
  use 'hoob3rt/lualine.nvim' -- statusline

  -- misc
  use 'vimwiki/vimwiki' -- wiki within vim
  use 'tpope/vim-unimpaired' -- common mappings

  -- possibly unmaintained
  use 'christoomey/vim-tmux-navigator' -- navigative between nvim and tmux
  use 'dag/vim-fish' -- fish script support
end)
