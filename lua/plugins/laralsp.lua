local LARA = {}


local function find_lsp_bin()
	return "/Users/faouzibouchkachekh/Faouzi/Rust/laralsp/target/debug/laralsp"
end

LARA.start = function()
	vim.lsp.start({
		name = "laralsp",
		cmd = { "/Users/faouzibouchkachekh/Faouzi/Rust/laralsp/target/debug/laralsp" },
		root_dir = vim.fs.dir_name(vim.fs.find({ "composer.json"}, { upwards = true })[1]),
	})
end

local group = vim.api.nvim_create_namespace("laralsp")

LARA.setup = function()
	vim.api.nvim_clear_autocmds({group = group})
	vim.api.nvim_create_autocmd("FileType",{
		group = group,
		pattern = {"blade", "php"},
		callback = LARA.start,
	})
end

return LARA
