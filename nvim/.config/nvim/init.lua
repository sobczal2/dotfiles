require 'core.keymaps'
require 'core.options'
require 'core.autocmds'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    require 'plugins.neo-tree',
    require 'plugins.catppuccin',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.lspconfig',
    require 'plugins.nvim-cmp',
    require 'plugins.none-ls',
    require 'plugins.rustaceanvim',
    require 'plugins.gitsigns',
    require 'plugins.alpha',
    require 'plugins.which-key',
    require 'plugins.todo-comments',
    require 'plugins.flash',
    require 'plugins.harpoon',
    require 'plugins.toggleterm',
    require 'plugins.nvim-dap-ui',
    require 'plugins.project',
}

vim.cmd.colorscheme 'catppuccin'
