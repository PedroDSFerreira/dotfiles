return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local key_opts = { noremap = true, silent = true }
		local on_attach = function(_, bufnr)
			key_opts.buffer = bufnr

			-- set keybinds
			key_opts.desc = "Code references"
			keymap.set("n", "<leader>cR", "<cmd>Telescope lsp_references<CR>", key_opts) -- show definition, references

			key_opts.desc = "Code declaration"
			keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, key_opts) -- go to declaration

			key_opts.desc = "Code definitions"
			keymap.set("n", "<leader>cd", "<cmd>Telescope lsp_definitions<CR>", key_opts) -- show lsp definitions

			key_opts.desc = "Code implementations"
			keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_implementations<CR>", key_opts) -- show lsp implementations

			key_opts.desc = "Code type definitions"
			keymap.set("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<CR>", key_opts) -- show lsp type definitions

			key_opts.desc = "Code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, key_opts) -- see available code actions, in visual mode will apply to selection

			key_opts.desc = "Smart rename"
			keymap.set("n", "<leader>cr", vim.lsp.buf.rename, key_opts) -- smart rename

			key_opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", key_opts) -- show  diagnostics for file

			key_opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, key_opts) -- show diagnostics for line

			key_opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, key_opts) -- jump to previous diagnostic in buffer

			key_opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, key_opts) -- jump to next diagnostic in buffer

			key_opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, key_opts) -- show documentation for what is under cursor
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-------------------- DIAGNOSTICS
		local signs = { Error = " ", Warn = " ", Hint = "󰛩 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●", -- Could be '■', '▎', 'x'
			},
		})

		vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#ffffff]])
		vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#ffffff]])

		local border = {
			{ "╭", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╮", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "╯", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╰", "FloatBorder" },
			{ "│", "FloatBorder" },
		}

		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		--------------------

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,

			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})
		lspconfig["docker_compose_language_service"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["emmet_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		lspconfig["matlab_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				completeUnimported = true,
				usePlaceholders = true,
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		})
		lspconfig["marksman"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		-- lspconfig["rust_analyzer"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	settings = {
		-- 		["rust-analyzer"] = {
		-- 			diagnostics = {
		-- 				enable = false,
		-- 			},
		-- 		},
		-- 	},
		-- })
		-- lspconfig["solargraph"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })
	end,
}
