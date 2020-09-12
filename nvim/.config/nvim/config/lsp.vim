lua require("lsp")

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Show errors after 1 second
set updatetime=1000

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Prevent column from jumping when errors display
set signcolumn=yes:1

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
