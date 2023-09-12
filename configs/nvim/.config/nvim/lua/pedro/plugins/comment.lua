return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require("Comment").setup({
      toggler = {
        ---Line-comment toggle keymap
        line = '<leader>ç',
        ---Block-comment toggle keymap
        block = 'gbc',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<leader>ç',
        ---Block-comment keymap
        block = 'gb',
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = false,
      },
    })
  end
}
