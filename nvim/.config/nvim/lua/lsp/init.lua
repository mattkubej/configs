local completion = require('completion')
local diagnostic = require('diagnostic')
local nvim_lsp = require('nvim_lsp')

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)

  vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
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
