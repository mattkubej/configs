let mapleader = "\<Space>"

" personal configuration
lua require('mk')

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
