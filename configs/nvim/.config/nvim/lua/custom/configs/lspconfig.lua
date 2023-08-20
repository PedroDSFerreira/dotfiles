local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "clangd",
  "html",
  "emmet_ls",
  "cssls",
  "tsserver",
  "eslint",
  "lua_ls",
  "docker_compose_language_service",
  "dockerls",
  "jsonls",
  -- "rubocop",
  "solargraph",
  "pyright",
  "yamlls",
  "bashls",
  "matlab_ls",
  "rust_analyzer",
  "sqlls",
  "arduino_language_server",
  "jdtls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["solargraph"].setup {
  flags = {
        debounce_text_changes = 150,
    },
}
