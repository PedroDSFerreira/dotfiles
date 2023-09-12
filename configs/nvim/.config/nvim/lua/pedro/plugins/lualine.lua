return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function lsp_progress()
      local messages = vim.lsp.util.get_progress_messages()
      if #messages == 0 then
        return ""
      end
      local status = {}
      for _, msg in pairs(messages) do
        table.insert(status, (msg.percentage or 0) .. "%% ")
      end
      local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners
      return string.format("%%#St_LspProgress# %s %s", spinners[frame + 1], table.concat(status, " | "))
    end

    local function git()
      if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
        return ""
      end

      local git_status = vim.b.gitsigns_status_dict

      local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
      local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
      local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
      local branch_name = "  " .. git_status.head

      return "%#St_gitIcons#" .. branch_name .. added .. changed .. removed
    end

    local function get_buffers_count()
      local count = 0
      for buffer = 1, vim.fn.bufnr('$') do
        local is_listed = vim.fn.buflisted(buffer) == 1
        if is_listed then
          count = count + 1
        end
      end

      return " " .. count
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { function() return '' end },
        lualine_b = { 'filename' },
        lualine_c = { git },
        lualine_x = { lsp_progress, 'diagnostics' },
        lualine_y = { 'filetype' },
        lualine_z = { get_buffers_count }
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
