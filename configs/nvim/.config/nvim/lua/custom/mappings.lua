---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- ["<leader>f"] = { name = "+Find" },
    -- ["<leader>g"] = { name = "+Git" },
    -- ["<leader>t"] = { name = "+Toggle" },
    -- ["<leader>c"] = { name = "+Code" },

    ["<leader>tt"] = {
      "<cmd>lua require('base46').toggle_transparency()<CR>",
      "Toggle transparency",
    },
    -- ["<leader>th"] = {
    --   "",
    --   "Horizontal Terminal",
    -- },

  },
}

M.comment = {
  -- toggle comment in both modes
  n = {
    ["<leader>ç"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>ç"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.nvimtree = {
  n = {
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>b"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fl"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "Find recent files" },
    ["<leader>fc"] = { "<cmd> Telescope aerial <CR>", "Find code blocks" },
    ["<leader>ff"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find current buffer" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "Git branches" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>gf"] = { "<cmd> Telescope git_files <CR>", "Git files" },

  },
}

M.aerial = {
  n = {
    ["m"] = { "<cmd> AerialPrev <CR>", "Previous" },
    ["n"] = { "<cmd> AerialNext <CR>", "Next" },
  },
}

M.lsp = {
  n = {
    ["<leader>cd"] = { "<cmd> Telescope lsp_definitions <CR>", "Go to definition" },
    ["<leader>ci"] = { "<cmd> Telescope lsp_implementations <CR>", "Go to implementation" },
    ["<leader>cr"] = { "<cmd> Telescope lsp_references <CR>", "Go to references" },
    ["<leader>cs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Go to document symbols" },
    ["<leader>ct"] = { "<cmd> Telescope lsp_type_definitions <CR>", "Type definition" },
  }
}

M.zen = {
  n = {
    ["<leader>z"] = {
      function()
        require("zen-mode").toggle()
      end,
      "Toggle zen mode"
    },
  },
}

-- Disabled default mappings
M.disabled = {
  n = {
    ["<leader>/"] = "",
    ["<C-n>"] = "",
    ["<leader>e"] = "",
    ["<leader>n"] = "",
    ["<leader>ff"] = "",
    ["<leader>fo"] = "",
    ["<leader>fz"] = "",
    ["<leader>cm"] = "",
    ["<leader>ch"] = "",
    ["<leader>cc"] = "",
    ["<leader>gt"] = "",
    ["<leader>D"] = "",
    ["<leader>th"] = "",

  },

  v = {
    ["<leader>/"] = "",
  }
}



return M
