vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format() end, {})

-- Setup DbBrowser
local dbbrowser_ui = require("dbbrowser").ui()

vim.keymap.set('n', '<space>ll', function() dbbrowser_ui.list_databases()  end, {})
