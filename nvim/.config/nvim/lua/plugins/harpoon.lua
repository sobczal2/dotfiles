return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    keys = function()
        local harpoon = require 'harpoon'
        return {
            {
                '<leader>H',
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
            },
            {
                '<leader>h',
                function()
                    harpoon:list():add()
                end,
            },
            {
                '<c-1>',
                function()
                    harpoon:list():select(1)
                end,
            },
            {
                '<c-2>',
                function()
                    harpoon:list():select(2)
                end,
            },
            {
                '<c-3>',
                function()
                    harpoon:list():select(3)
                end,
            },
            {
                '<c-4>',
                function()
                    harpoon:list():select(4)
                end,
            },
            {
                '<c-5>',
                function()
                    harpoon:list():select(5)
                end,
            },
            {
                '<c-6>',
                function()
                    harpoon:list():select(6)
                end,
            },
            {
                '<c-7>',
                function()
                    harpoon:list():select(7)
                end,
            },
            {
                '<c-8>',
                function()
                    harpoon:list():select(8)
                end,
            },
            {
                '<c-9>',
                function()
                    harpoon:list():select(9)
                end,
            },
            {
                '<c-10>',
                function()
                    harpoon:list():select(10)
                end,
            },
            { '<leader>fh', '<cmd>Telescope harpoon marks<cr>', desc = '[F]ind [H]arpoon' },
        }
    end,
    config = function()
        require('telescope').load_extension 'harpoon'
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
}
