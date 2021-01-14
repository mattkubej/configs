" ========================================
" --> editor settings
" ========================================
set shell=/bin/bash
let mapleader = "\<Space>"

set nocompatible
filetype plugin on
syntax on

set tabstop=2 shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set nowrap
set hidden
set relativenumber

set clipboard=unnamedplus
set backspace=indent,eol,start
set laststatus=2
set noshowmode
set timeout timeoutlen=1000 ttimeoutlen=100

" turn backup off
set nobackup
set nowb
set noswapfile

" permanent undo
set undodir=~/.vimdid
set undofile

" turn off sounds
set noerrorbells
set novisualbell
set tm=500

" search
set incsearch
set smartcase

" gui
set termguicolors
set number
set colorcolumn=80
set t_vb=

" do not save any netrw history or bookmarks
let g:netrw_dirhistmax=0

" ========================================
" --> plugins
" ========================================
call plug#begin('~/.vim/plugged')

Plug 'aklt/plantuml-syntax'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/vim-slumlord'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'kubejm/jest.nvim'

" trying these out
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-sensible'
Plug 'dag/vim-fish'
Plug 'lervag/vimtex'
Plug 'prettier/vim-prettier'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'junegunn/gv.vim'

" Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Initialize plugin system
call plug#end()

" ========================================
" --> plugins - nerdtree
" ========================================
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" ========================================
" --> plugins - vim-ripgrep
" ========================================
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap <leader>z :RG<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" ========================================
" --> plugins - easy align
" ========================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ========================================
" --> plugins - vim-indent-guides
" ========================================
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=240

" ========================================
" --> plugins - base16
" ========================================
let base16colorspace=256
colorscheme base16-gruvbox-dark-soft

" ========================================
" --> plugins - lsp
" ========================================
source $HOME/.config/nvim/config/lsp.vim

" ========================================
" --> plugins - treesitter
" ========================================
source $HOME/.config/nvim/config/treesitter.vim

" ========================================
" --> plugins - telescope
" ========================================
source $HOME/.config/nvim/config/telescope.vim

" ========================================
" --> plugins - vimwiki
" ========================================
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_url_maxsave=0
let g:vimwiki_global_ext=0

" ========================================
" --> plugins - ale
" ========================================
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

" ========================================
" --> plugins - vimtex
" ========================================
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'

" ========================================
" --> merlin
" ========================================
if executable('opam')
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
endif

" ========================================
" --> key bindings
" ========================================
:imap jk <Esc>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader><leader> <c-^>

nnoremap <leader>l :nohl<CR><C-L>

nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" ========================================
" --> Remove trailing whitespace on save
" ========================================
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_WS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
