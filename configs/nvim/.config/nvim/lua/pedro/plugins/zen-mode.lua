return {
	"folke/zen-mode.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("zen-mode").setup({
			window = {
				width = 0.7,
				height = 0.9,
				options = {
					scrolloff = 10,
				},
			},
		})
	end,
	init = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>z", "<cmd>:lua require('zen-mode').toggle() <CR>", { desc = "Toggle zen mode" })
	end,
}
