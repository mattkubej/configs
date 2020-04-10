set shell=/bin/bash
let mapleader = "\<Space>"

set nocompatible
filetype plugin on
syntax on
 
set tabstop=2 shiftwidth=2 expandtab
set autoindent
set smartindent
set cindent
 
set number
set clipboard=unnamedplus
set backspace=indent,eol,start
set laststatus=2
set noshowmode
set timeout timeoutlen=1000 ttimeoutlen=100
 
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=240
 
call plug#begin('~/.vim/plugged')
 
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'

" trying these out
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim'
Plug 'derekwyatt/vim-scala'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sensible' 
Plug 'dag/vim-fish' 
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()
 
" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
 let NERDTreeShowHidden=1
 
" Autoformat
noremap <F3> :Autoformat<CR>
 
" cursorline, turning off temporarily, introducing lag
 "set cursorline

" jsx highlighting and indenting for .js files
let g:jsx_ext_required = 0

" fzf
nnoremap <c-p> :FZF<cr>
nnoremap <leader>z :Ag<cr>

" Turn backup off
set nobackup
set nowb
set noswapfile

" map jk for escape
:imap jk <Esc>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Start interactive EasyAlign in visual mode (e.g. vipga)
 xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
 nmap ga <Plug>(EasyAlign)

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

set colorcolumn=80 " and give me a colored column

let base16colorspace=256
colorscheme base16-gruvbox-dark-soft
set termguicolors

" Permanent undo
set undodir=~/.vimdid
set undofile

" COC
" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"complete_info() is an unknown function
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" vimwiki change to markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_url_maxsave=0
let g:vimwiki_global_ext=0
