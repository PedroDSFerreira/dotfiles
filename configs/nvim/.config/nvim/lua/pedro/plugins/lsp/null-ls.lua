return {
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		local keymap = vim.keymap -- for conciseness

		local key_opts = { noremap = true, silent = true }
		-- set keybinds
		key_opts.desc = "Code format"
		keymap.set("n", "<leader>cf", ":lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", key_opts) -- show definition, references

		key_opts.desc = "Code format"
		keymap.set("v", "<leader>cf", ":lua vim.lsp.buf.range_formatting()<CR>'", key_opts) -- show definition, references
	end,
	config = function()
		-- import null-ls plugin
		local null_ls = require("null-ls")

		local null_ls_utils = require("null-ls.utils")

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- configure null_ls
		null_ls.setup({
			sources = {
				-- Python
				diagnostics.flake8,
				formatting.isort,
				formatting.black,
				formatting.autoflake,
				-- Ruby
				diagnostics.erb_lint,
				formatting.erb_format,
				-- diagnostics.rubocop,
				formatting.rubocop,
				-- Rust
				formatting.rustfmt,
				-- C/C++/Java
				formatting.clang_format,
				-- JS/TS/HTML/CSS/MD/JSON
				diagnostics.eslint,
				formatting.prettier,
				-- Lua
				formatting.stylua,
				-- Go
				formatting.gofmt,
				formatting.goimports,
				-- Shell
				formatting.shfmt,
			},

			-- to setup format on save
			-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			-- configure format on save
			-- on_attach = function(current_client, bufnr)
			-- 	if current_client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				vim.lsp.buf.format({
			-- 					filter = function(client)
			-- 						--  only use null-ls for formatting instead of lsp server
			-- 						return client.name == "null-ls"
			-- 					end,
			-- 					bufnr = bufnr,
			-- 				})
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})
	end,
}
