return {
    'ahmedkhalf/project.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    opts = {},
    config = function()
        require('telescope').load_extension 'projects'
    end,
    keys = {
        { '<leader>fp', "<cmd>lua require'telescope'.extensions.projects.projects{} <cr>", desc = '[F]ind [P]rojects' },
    },
}
