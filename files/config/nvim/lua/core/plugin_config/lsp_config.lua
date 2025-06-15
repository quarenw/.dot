local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return
end

mason.setup()

local masonlsp_ok, masonlsp = pcall(require, 'mason-lspconfig')
if not masonlsp_ok then
  return
end

masonlsp.setup()

local cmplsp_ok, cmpslp = pcall(require, 'cmp_nvim_lsp')
if not cmplsp_ok then
  return
end

local capabilities = cmpslp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_ok, lsp = pcall(require, 'lspconfig')
if not lsp_ok then
  return
end

local lua_ls_config = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
    },
  },
}

vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>")

local gopls_config = {
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = false,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true
  },
}

local servers = {
  { 'lua_ls' },
  { 'clangd' },
  { 'ts_ls' },
}

for _, server in pairs(servers) do
  local config = lsp[server[1]]
  if (vim.fn.executable(config.document_config.default_config.cmd[1])) == 1 then
    local setup_config = {
      capabilities = capabilities
    }
    for k, v in pairs(server) do
      if type(k) ~= 'number' then
        setup_config[k] = v
      end
    end
    config.setup(setup_config)
  end
end

