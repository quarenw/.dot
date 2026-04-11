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

-- Set global capabilities for all LSP servers
vim.lsp.config('*', { capabilities = capabilities })

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

local gopls_config = {
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

vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>")

local servers = {
  { 'lua_ls', settings = lua_ls_config.settings },
  { 'clangd' },
  { 'ts_ls' },
  -- Added gopls as it was defined but missing from the loop
  { 'gopls', settings = gopls_config.settings, init_options = gopls_config.init_options },
}

for _, server in ipairs(servers) do
  local name = server[1]
  -- Get the default configuration provided by nvim-lspconfig
  local config = vim.lsp.config[name]
  
  -- Check if the server executable exists
  if config and config.cmd and vim.fn.executable(config.cmd[1]) == 1 then
    local setup_config = {}
    for k, v in pairs(server) do
      if type(k) ~= 'number' then
        setup_config[k] = v
      end
    end
    
    -- Apply the configuration
    vim.lsp.config(name, setup_config)
    -- Enable the server
    vim.lsp.enable(name)
  end
end
