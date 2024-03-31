require("mason").setup()

require("mason-lspconfig").setup({
  automatic_installation = true,
})

local servers = {
  { 'lua_ls' },
  { 'clangd' },
  { 'tsserver' },
}

local lsp = require('lspconfig')
for _, server in pairs(servers) do
    local config = lsp[server[1]]
    local server_executable = config.document_config.default_config.cmd
    if(type(server_executable) ~= "table") then
        break
    end
    server_executable = server_executable[1]

    if(vim.fn.executable(server_executable) == 1) then
        local opts = {}
        for k, v in pairs(server) do
            if type(k) ~= 'number' then
                opts[k] = v
            end
        end

        config.setup(opts)
    end
end

