---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>tt"] = {
      "<cmd>lua require('base46').toggle_transparency()<CR>",
      "Toggle transparency",
    },
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
    -- toggle
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fl"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "Find recent files" },
    ["<leader>fc"] = { "<cmd> Telescope aerial <CR>", "Find code blocks" },
    ["<leader>ff"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find current buffer" },
    ["<leader>fd"] = { "<cmd> Telescope lsp_definitions <CR>", "Find definition" },

  },
}

M.aerial = {
  n = {
    ["<leader>a"] = { "<cmd> AerialToggle <CR>", "Toggle aerial" },
    ["m"] = { "<cmd> AerialPrev <CR>", "Previous" },
    ["n"] = { "<cmd> AerialNext <CR>", "Next" },
  },
}

M.zen = {
  n = {
    ["<leader>z"] = {
      function()
        require("true-zen.ataraxis").toggle()
      end,
      "Toggle zen mode"
    },

    ["<leader>tm"] = {
      function()
        require("true-zen.minimalist").toggle()
      end,
      "Toggle minimalist mode"
    },

    ["<leader>tf"] = {
      function()
        require("true-zen.ataraxis").toggle()
      end,
      "Toggle focus mode"
    },
  },

  v = {
    ["<leader>z"] = { ":'<,'>TZNarrow<CR>", "Toggle narrow mode" },
  }
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
  },

  v = {
    ["<leader>/"] = "",
  }
}



return M
