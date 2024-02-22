return {
	"neovim/nvim-lspconfig",
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_lspconfig()

		local lspconfig = require("lspconfig")


		local group = vim.api.nvim_create_namespace("laralsp")

		vim.api.nvim_clear_autocmds({ group = group })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = { "blade", "php" },
			callback = function()
				vim.lsp.start({
					name = "laralsp",
					cmd = { "/Users/faouzibouchkachekh/Faouzi/Rust/laralsp/target/release/laralsp" },
					root_dir = vim.fs.find({ "composer.json" }, { upwards = true })[1],
				})
			end,
		})

		lspconfig.lua_ls.setup({
			Lua = {
				globals = { "vim" },
			},
		})
		lspconfig.sourcekit.setup{}
		lspconfig.pyright.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.ocamllsp.setup({})
		lspconfig.templ.setup({})
		lspconfig.gopls.setup({})
		lspconfig.rust_analyzer.setup({
			-- Server-specific settings. See `:help lspconfig-setup`
			settings = {
				["rust-analyzer"] = {},
			},
		})
		lspconfig.intelephense.setup({})
		lspconfig.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})
		lspconfig.htmx.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		})

		vim.filetype.add({ extension = { templ = "templ" } })
		vim.filetype.add({ extension = { php = "php" } })
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})
	end,
}
