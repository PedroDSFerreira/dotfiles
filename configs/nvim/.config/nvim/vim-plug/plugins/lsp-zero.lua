local lsp = require('lsp-zero')

lsp.preset("recomended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'jsonls',
    'rust_analyzer',
    'pyright',
    'vimls',
    'bashls',
    'dockerls',
    'docker_compose_language_service',
    'yamlls',
    'clangd',
    'html',
    'cssls',
    'java_language_server',
    'lua_ls',
    'sqlls',
    -- 'matlab-language-server',
    'arduino_language_server',
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
