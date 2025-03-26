return {
    'folke/which-key.nvim',
    config = function()
        local wk = require 'which-key'
        wk.add {
            { '<leader>d', group = 'Debug' },
            { '<leader>r', group = 'Run' },
            { '<leader>c', group = 'Code' },
            { 'g', group = 'Goto' },
        }
    end,
}
