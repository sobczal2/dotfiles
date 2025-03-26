return {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    config = function()
        vim.g.rustaceanvim = {}
    end,
    keys = {
        { '<leader>dc', '<cmd>RustLsp debug<cr>', ft = 'rust', desc = '[D]ebug [C]urrent' },
        { '<leader>ds', '<cmd>RustLsp debuggables<cr>', ft = 'rust', desc = '[D]ebug [S]earch' },
        { '<leader>dl', '<cmd>RustLsp! debug<cr>', ft = 'rust', desc = '[D]ebug [L]ast' },
        { '<leader>rc', '<cmd>RustLsp run<cr>', ft = 'rust', desc = '[R]un [C]urrent' },
        { '<leader>rs', '<cmd>RustLsp runnables<cr>', ft = 'rust', desc = '[R]un [S]earch' },
        { '<leader>rl', '<cmd>RustLsp! run<cr>', ft = 'rust', desc = '[R]un [L]ast' },
        { '<leader>ts', '<cmd>RustLsp testables<cr>', ft = 'rust', desc = '[T]est [S]earch' },
        { '<leader>tl', '<cmd>RustLsp! testables<cr>', ft = 'rust', desc = '[T]est [L]ast' },
    },
}
