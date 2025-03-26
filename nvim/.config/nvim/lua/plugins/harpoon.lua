return {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>h', '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = '[H]arpoon current file' },
        { '<leader>H', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = 'Open [H]arpoon menu' },
        { '<c-1>', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', desc = 'Navigate to file [1]' },
        { '<c-2>', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', desc = 'Navigate to file [2]' },
        { '<c-3>', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', desc = 'Navigate to file [3]' },
        { '<c-4>', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', desc = 'Navigate to file [4]' },
        { '<c-5>', '<cmd>lua require("harpoon.ui").nav_file(5)<cr>', desc = 'Navigate to file [5]' },
        { '<c-6>', '<cmd>lua require("harpoon.ui").nav_file(6)<cr>', desc = 'Navigate to file [6]' },
        { '<c-7>', '<cmd>lua require("harpoon.ui").nav_file(7)<cr>', desc = 'Navigate to file [7]' },
        { '<c-8>', '<cmd>lua require("harpoon.ui").nav_file(8)<cr>', desc = 'Navigate to file [8]' },
        { '<c-9>', '<cmd>lua require("harpoon.ui").nav_file(9)<cr>', desc = 'Navigate to file [9]' },
        { '<c-10>', '<cmd>lua require("harpoon.ui").nav_file(10)<cr>', desc = 'Navigate to file [10]' },
    },
}
