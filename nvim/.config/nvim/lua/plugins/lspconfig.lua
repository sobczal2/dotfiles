return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
                end
                local telescope = require 'telescope.builtin'
                map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                map('gr', telescope.lsp_references, '[G]oto [R]eferences')
                map('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
                map('<leader>ct', telescope.lsp_type_definitions, '[C]ode: [T]ype Definition')
                map('<leader>cd', telescope.lsp_document_symbols, '[C]ode: [D]ocument Symbols')
                map('<leader>cw', telescope.lsp_dynamic_workspace_symbols, '[C]ode: [W]orkspace Symbols')
                map('<leader>cr', vim.lsp.buf.rename, 'Code: [R]ename')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode: [A]ction', { 'n', 'x' })
                local client = vim.lsp.get_client_by_id(event.data.client_id)

                if client and client.name == 'ts_ls' then
                    client.server_capabilities.documentFormattingProvider = false
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
        local servers = {
            clangd = {},
            ts_ls = {},
            html = { filetypes = { 'html', 'twig', 'hbs' } },
            cssls = {},
            tailwindcss = {},
            dockerls = {},
            sqlls = {},
            jsonls = {},
            yamlls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        runtime = { version = 'LuaJIT' },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                '${3rd}/luv/library',
                                unpack(vim.api.nvim_get_runtime_file('', true)),
                            },
                        },
                        diagnostics = { disable = { 'missing-fields' } },
                        format = {
                            enable = false,
                        },
                    },
                },
            },
        }

        require('mason').setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua',
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        }
    end,
}
