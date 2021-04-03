" ========================================
" --> editor settings
" ========================================
let mapleader = "\<Space>"
inoremap <C-c> <esc>

" global functions must load first
lua require('mk.globals')

" neovim options
lua require('mk.options')

" load plugins
lua require('mk.plugins')

" load lsp
lua require("mk.lsp")

" do not save any netrw history or bookmarks
let g:netrw_dirhistmax=0

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
