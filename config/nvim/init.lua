require('rc/plugins')

require("rc/options")

vim.cmd('autocmd BufWritePost rc/plugins.lua PackerCompile')
