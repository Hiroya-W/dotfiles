require('rc/plugins')

require("rc/options")
require("rc/mappings")

vim.cmd('autocmd BufWritePost rc/plugins.lua PackerCompile')
