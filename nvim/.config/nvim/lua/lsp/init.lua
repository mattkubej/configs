local completion = require('completion')
local diagnostic = require('diagnostic')
local nvim_lsp = require('nvim_lsp')

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)
end

nvim_lsp.clangd.setup{
  cmd = { "clangd-9", "--background-index" },
  on_attach = on_attach,
}

nvim_lsp.gopls.setup{
  on_attach = on_attach,
}

nvim_lsp.html.setup{
  on_attach = on_attach,
}

nvim_lsp.ocamllsp.setup{
  on_attach = on_attach,
}

nvim_lsp.sumneko_lua.setup{
  on_attach = on_attach,
}

nvim_lsp.tsserver.setup{
  on_attach = on_attach,
}
