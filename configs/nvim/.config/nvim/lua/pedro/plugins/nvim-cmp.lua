return {
  "hrsh7th/nvim-cmp",
  event = "VimEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",           -- source for text in buffer
    "hrsh7th/cmp-path",             -- source for file system paths
    "L3MON4D3/LuaSnip",             -- snippet engine
    "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim",         -- vs-code like pictograms
    "hrsh7th/cmp-calc",             -- calculator for cmp
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end,
    },
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")
    local icons = lspkind.presets.default
    icons["Copilot"] = ""
    icons["calc"] = "󰃬"

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    local function border(hl_name)
      return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
      }
    end

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      window = {
        completion = {
          border = border "CmpBorder",
          scrollbar = false,
        },
        documentation = {
          border = border "CmpDocBorder",
          scrollbar = "║",
        }
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "calc" },
        { name = "buffer" },  -- text within current buffer
        { name = "path" },    -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        fields = { "kind", "abbr" },
        format = function(entry, vim_item)
          if entry.source.name == "calc" then
            vim_item.kind = "calc"
          end
          vim_item.kind = string.format(' %s ', icons[vim_item.kind])

          return vim_item
        end
      },
    })

    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#f2cdcd" })
  end,
}
