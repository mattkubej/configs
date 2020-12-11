local completion = require('completion')
local diagnostic = require('diagnostic')
local lsp = require('lspconfig')
local nlua = require('nlua.lsp.nvim')

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)
end

lsp.clangd.setup{
  cmd = { "clangd-9", "--background-index" },
  on_attach = on_attach,
}

lsp.gopls.setup{
  on_attach = on_attach,
}

lsp.html.setup{
  on_attach = on_attach,
}

lsp.ocamllsp.setup{
  on_attach = on_attach,
}

lsp.tsserver.setup{
  on_attach = on_attach,
}

nlua.setup(lsp, {
  on_attach = on_attach,
})
