return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },

			-- ensure these language parsers are installed
			ensure_installed = {
				"arduino",
				"bash",
				"c",
				"c_sharp",
				"cmake",
				"comment",
				"cpp",
				"css",
				"csv",
				"dockerfile",
				"gitignore",
				"html",
				"htmldjango",
				"http",
				"java",
				"javascript",
				"jq",
				"json",
				"lua",
				"matlab",
				"python",
				"regex",
				"ruby",
				"rust",
				"sql",
				"toml",
				"vim",
				"yaml",
			},

			-- auto install above language parsers
			auto_install = true,
		})
	end,
	init = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<C-p>", "<cmd> Telescope find_files <CR>", { desc = "Files" })
		keymap.set("n", "<leader>fl", "<cmd> Telescope find_files <CR>", { desc = "Files" })
		keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Buffers" })
		keymap.set(
			"n",
			"<leader>fa",
			"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
			{ desc = "All" }
		)
		keymap.set("n", "<leader>fg", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
		keymap.set("n", "<leader>fr", "<cmd> Telescope oldfiles <CR>", { desc = "Recent files" })
		keymap.set("n", "<leader>ff", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Current buffer" })
		keymap.set("n", "<leader>gc", "<cmd> Telescope git_commits <CR>", { desc = "Commits" })
		keymap.set("n", "<leader>gb", "<cmd> Telescope git_branches <CR>", { desc = "Branches" })
		keymap.set("n", "<leader>gs", "<cmd> Telescope git_status <CR>", { desc = "Git status" })
		keymap.set("n", "<leader>gf", "<cmd> Telescope git_files <CR>", { desc = "Git files" })
	end,
}
