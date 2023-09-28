return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "󰍵" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "│" },
		},
	},
	init = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>gp", "<cmd>:Gitsigns preview_hunk <CR>", { desc = "Preview hunk" })
		keymap.set("n", "<leader>gl", "<cmd>:Gitsigns toggle_current_line_blame <CR>", { desc = "Line blame" })
	end,
}
