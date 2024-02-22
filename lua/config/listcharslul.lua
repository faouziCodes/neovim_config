-- Enable list mode to display special characters
vim.opt.list = true

-- Set list characters to display Enter key symbol for end-of-line
vim.opt.listchars:append("eol:↲")

-- Optional: Map a key to toggle list mode
vim.api.nvim_set_keymap('n', '<Leader>l', ':set list!<CR>', { noremap = true, silent = true })

