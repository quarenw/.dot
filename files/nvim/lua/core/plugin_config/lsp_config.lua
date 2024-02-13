require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "biome" }
})

require("lspconfig").lua_ls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").biome.setup {}
