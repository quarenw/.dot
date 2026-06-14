local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then return end
mason.setup()
 
local masonlsp_ok, masonlsp = pcall(require, 'mason-lspconfig')
if not masonlsp_ok then return end
 
local cmplsp_ok, cmpslp = pcall(require, 'cmp_nvim_lsp')
if not cmplsp_ok then return end
 
local capabilities = cmpslp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
 
vim.lsp.config('*', { capabilities = capabilities })
 
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
    },
  },
})
 
vim.lsp.config('gopls', {
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = { unusedparams = true, shadow = false },
      staticcheck = true,
    },
  },
  init_options = { usePlaceholders = true },
})
 
masonlsp.setup()
 
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<Space>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
vim.keymap.set('n', '<Space>q', vim.diagnostic.setloclist, { desc = 'Diagnostic list' })