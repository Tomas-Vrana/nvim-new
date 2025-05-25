return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		--Shouldn't use because calls lsp twice
		-- config = function()
		-- 	require("mason-lspconfig").setup({})
		-- end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = { "clangd", "--offset-encoding=utf-16" },
			})

			lspconfig.vhdl_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.harper_ls.setup({
				settings = {
					["harper-ls"] = {
						linters = {
							SentenceCapitalization = false,
							LongSentences = true,
						},
					},
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					--lua
					null_ls.builtins.formatting.stylua,

					--c
					null_ls.builtins.formatting.clang_format,

					--bash
					null_ls.builtins.formatting.shfmt.with({
						filetypes = { "sh", "zsh" }, -- Enable formatting for shell scripts
					}),
				},

				-- format on save
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				experimental = {
					ghost_text = true,
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<kj>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 10 },
					{ name = "luasnip",  priority = 1 },
					{ name = "path" },
					{ name = "buffer" },
				}),
			})
		end,
	},
	{

		"hrsh7th/cmp-path",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node
			local f = ls.function_node

			ls.add_snippets("c", {
				s("jd", {
					t({ "/**", " * " }),
					i(1, "Description"),
					t({ "", " *" }),
					t({ "", " * @param " }),
					i(2, "param"),
					t({ "", " * @return " }),
					i(3, "return"),
					t({ "", " */" }),
				}),
			})
			local date = function()
				return os.date("%d-%m-%Y %H:%M:%S")
			end

			local filename = function()
				return vim.fn.expand("%:t")
			end

			ls.add_snippets("c", {
				s("credits", {
					t("/* ========================================================================="),
					t({ "", " * File:        | " }),
					f(filename, {}),
					t({ "", " * Author:      | " }),
					i(1),
					t({ "", " * Date:        | " }),
					f(date, {}),
					t({ "", " * Description: | " }),
					i(2),
					t({ "", " *              " }),
					t({ "", " * License:     | " }),
					i(3),
					t({ "", " * =========================================================================", " */" }),
				}),
			})
		end,
	},
	--
}
