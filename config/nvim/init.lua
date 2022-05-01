require('rc/plugins')

vim.cmd('autocmd BufWritePost rc/plugins.lua PackerCompile')
