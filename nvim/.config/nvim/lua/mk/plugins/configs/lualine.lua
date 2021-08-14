require('lualine').setup{
  options = {
    theme = 'gruvbox-flat',
    icons_enabled = false,
  },
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1
      }
    }
  },
  extensions = { 'fugitive', 'fzf', 'nerdtree' }
}
