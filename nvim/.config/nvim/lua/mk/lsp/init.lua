local completion = require('completion')
local lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
end

lsp.clangd.setup{
  cmd = {
    "clangd-11",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
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

lsp.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
    }
  },
  on_attach = on_attach,
}
