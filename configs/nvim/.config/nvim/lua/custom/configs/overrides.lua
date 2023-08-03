local M = {}

M.treesitter = {
  ensure_installed = {
    -- defaults 
    "vim",
    "lua",
    "bash",
    "regex",
    "diff",
    "dockerfile",
    "gitignore",


    -- web dev 
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",

    -- software dev
    "java",
    "jq",
    "json",
    "python",
    "ruby",
    "rust",
    "sql",

    -- others
    "matlab",
    "cpp",


    -- low level
    "c",
    "verilog",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "python-lsp-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  sources = {
    { name = "copilot",  group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 2 },
  },
}

return M
