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
 
Plug 'Chiel92/vim-autoformat'
Plug 'aklt/plantuml-syntax'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/vim-slumlord'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

" trying these out
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-sensible' 
Plug 'dag/vim-fish' 
Plug 'lervag/vimtex'

" Initialize plugin system
call plug#end()
 
" ========================================
" --> plugins - nerdtree 
" ========================================
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeShowHidden=1
 
" ========================================
" --> plugins - vim-jsx 
" ========================================
let g:jsx_ext_required = 0

" ========================================
" --> plugins - fzf 
" ========================================
nnoremap <c-p> :Files<cr>

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
" --> plugins - coc 
" ========================================
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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

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
" --> plugins - autoformat 
" ========================================
noremap <F3> :Autoformat<CR>

" ========================================
" --> plugins - coc-prettier 
" ========================================
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>p :Prettier<CR>
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" consider removing these
" noremap <leader>p :read !xsel --clipboard --output<cr>
" noremap <leader>c :w !xsel -ib<cr><cr>

