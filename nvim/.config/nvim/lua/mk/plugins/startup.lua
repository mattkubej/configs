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

  -- general language configuration
  use 'dense-analysis/ale' -- ale linting
  use 'editorconfig/editorconfig-vim' -- EditorConfig plugin
  use 'neovim/nvim-lspconfig' -- common lsp configurations
  use 'nvim-lua/completion-nvim' -- auto-completion for lsp
  use 'scrooloose/nerdcommenter' -- comment functions
  use 'jxnblk/vim-mdx-js' -- mdx highlighting
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- language specific plugins
  use 'HerringtonDarkholme/yats.vim' -- yet another TypeScript syntax
  use 'fatih/vim-go' -- Go language support
  use 'kubejm/jest.nvim' -- jest test runner
  use 'mattn/emmet-vim' -- emmet shortcuts
  use 'maxmellon/vim-jsx-pretty' -- jsx syntax highlighting and indenting
  use 'pangloss/vim-javascript' -- js syntax highlighting and indenting
  use 'prettier/vim-prettier' -- prettier integration

  -- search/navigation
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
  use 'junegunn/fzf.vim'
  use 'nvim-lua/telescope.nvim' -- fuzzy finder and previewer
  use 'scrooloose/nerdtree' -- file explorer

  -- aesthetics
  use 'chriskempson/base16-vim' -- base16 color themes
  use 'hoob3rt/lualine.nvim' -- statusline

  -- misc
  use 'vimwiki/vimwiki' -- wiki within vim

  -- possibly unmaintained
  use 'christoomey/vim-tmux-navigator' -- navigative between nvim and tmux
  use 'dag/vim-fish' -- fish script support
end)
