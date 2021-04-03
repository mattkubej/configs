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
augroup TRIM_WS
    autocmd! BufWritePre * %s/\s\+$//e
augroup END
