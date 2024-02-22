return {
	--"L3MON4D3/LuaSnip",
	-- "folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	require("plugins.catppuccin_plugin"),
	"nvim-lua/plenary.nvim",
	"tpope/vim-fugitive",
	require("plugins.nvim_lspconfig"),
	require("plugins.telescope"),
	require("plugins.nvim_cmp"),
	require("plugins.lsp_zeroplugin"),
	require("plugins.none-ls"),
	-- require("plugins.hover_config")
	require("plugins.tokyodarknvim"),
	-- require("plugins.ai"),
	require("plugins.lspkind_plugin"),
	--	{ "savq/melange-nvim" },
	{
	  "j-hui/fidget.nvim",
	  opts = {
	  },
	  config= function ()
		local fidget = require("fidget")
		fidget.setup {}
	  end
	},
	'ray-x/aurora',
	'rktjmp/lush.nvim',
	'kartikp10/noctis.nvim',
	'luisiacc/gruvbox-baby'
}
