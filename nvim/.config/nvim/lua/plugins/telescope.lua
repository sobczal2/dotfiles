return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = function()
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles', noremap = true, silent = true })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep,
            { desc = 'Telescope live grep', noremap = true, silent = true })
    end,
}
