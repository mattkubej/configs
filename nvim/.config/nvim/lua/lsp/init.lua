local completion = require('completion')
local lsp = require('lspconfig')
local nlua = require('nlua.lsp.nvim')

local on_attach = function(client)
  completion.on_attach(client)
end

lsp.clangd.setup{
  cmd = { "clangd-11", "--background-index" },
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
