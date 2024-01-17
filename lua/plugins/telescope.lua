return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function () 
		vim.keymap.set('n', '<space>ff', function ()vim.cmd [[Telescope find_files]] end, {})
		vim.keymap.set('n', '<space>fg', function ()vim.cmd [[Telescope live_grep]] end, {})
		vim.keymap.set('n', '<space>fb', function ()vim.cmd [[Telescope find_buffers]] end, {})
		vim.keymap.set('n', '<space>fh', function ()vim.cmd [[Telescope help_tags]] end, {})
	end
}
