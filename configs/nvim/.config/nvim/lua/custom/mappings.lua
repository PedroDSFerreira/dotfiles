---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
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
    -- find
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
  },
}

-- Disabled default mappings
M.disabled = {
  n = {
    ["<leader>/"] = "",
    ["<C-n>"] = "",
  }
}

return M
