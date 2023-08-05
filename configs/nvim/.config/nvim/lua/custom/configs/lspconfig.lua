local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "emmet_ls",
  "cssls",
  "tsserver",
  "eslint",
  "clangd",
  "rubocop",
  "arduino_language_server",
  "lua_ls",
  "docker_compose_language_service",
  "dockerls",
  "jsonls",
  "java_language_server",
  "yamlls",
  "bashls",
  "matlab_ls",
  "rust_analyzer",
  "sqlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end