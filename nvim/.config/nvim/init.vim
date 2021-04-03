" ========================================
" --> editor settings
" ========================================
let mapleader = "\<Space>"

" global functions must load first
lua require('mk.globals')

" neovim options
lua require('mk.options')

" load plugins
lua require('mk.plugins')

" load lsp
lua require("mk.lsp")

" load keymaps
lua require("mk.mappings")

" ========================================
" --> key bindings
" ========================================
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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
