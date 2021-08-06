require'nvim-treesitter.configs'.setup{
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = { "ocaml" },
  },
  indent = {
    enable = true,
  },
}
