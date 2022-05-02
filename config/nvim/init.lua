require("rc/plugins")
require("rc/options")
require("rc/mappings")

-- packer-custom-initialization
-- This approach has the benefit of not requiring that the `packer` plugin be loaded unless you want to
-- perform plugin management operations, but it is more involved to use.
vim.cmd[[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)]]
vim.cmd[[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)]]
vim.cmd[[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)]]
vim.cmd[[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd[[command! PackerCompile packadd packer.nvim | lua require('plugins').compile('~/.config/nvim/plugin/packer_load.vim')]]
vim.cmd[[command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>')]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
