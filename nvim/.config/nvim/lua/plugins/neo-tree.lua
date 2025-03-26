return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    lazy = false,
    opts = {},
    cmd = function()
        vim.keymap.set('n', '<leader>e', '<cmd> Neotree toggle position=left <CR>', { noremap = true, silent = true })
    end,
}
