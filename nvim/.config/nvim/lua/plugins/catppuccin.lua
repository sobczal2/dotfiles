return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    opts = {
        flavour = 'macchiato',
        integrations = {
            alpha = true,
            cmp = true,
            fidget = true,
            flash = true,
            gitsigns = true,
            harpoon = true,
            mason = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { 'italic' },
                    hints = { 'italic' },
                    warnings = { 'italic' },
                    information = { 'italic' },
                    ok = { 'italic' },
                },
                underlines = {
                    errors = { 'underline' },
                    hints = { 'underline' },
                    warnings = { 'underline' },
                    information = { 'underline' },
                    ok = { 'underline' },
                },
                inlay_hints = {
                    background = true,
                },
            },
            telescope = true,
            treesitter = true,
            which_key = true,
        },
    },
}
