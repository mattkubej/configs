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

" load keymaps
lua require("mk.mappings")

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
