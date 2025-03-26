return {
    'mrcjkb/nvim-dap',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
    },
    keys = {
        {
            '<leader>db',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = '[D]ebug [B]reakpoint Toggle',
        },
        {
            '<leader>dB',
            function()
                require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = '[D]ebug Conditional [B]reakpoint',
        },
        {
            '<leader>dl',
            function()
                require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
            end,
            desc = '[D]ebug [L]og Point',
        },
        {
            '<leader>dc',
            function()
                require('dap').continue()
            end,
            desc = '[D]ebug [C]ontinue',
        },
        {
            '<leader>dp',
            function()
                require('dap').pause()
            end,
            desc = '[D]ebug [P]ause',
        },
        {
            '<leader>dr',
            function()
                require('dap').restart()
            end,
            desc = '[D]ebug [R]estart',
        },
        {
            '<leader>dq',
            function()
                require('dap').terminate()
            end,
            desc = '[D]ebug [Q]uit',
        },
        {
            '<leader>do',
            function()
                require('dap').step_over()
            end,
            desc = '[D]ebug Step [O]ver',
        },
        {
            '<leader>di',
            function()
                require('dap').step_into()
            end,
            desc = '[D]ebug Step [I]nto',
        },
        {
            '<leader>dO',
            function()
                require('dap').step_out()
            end,
            desc = '[D]ebug Step [O]ut',
        },
        {
            '<leader>du',
            function()
                require('dapui').toggle()
            end,
            desc = '[D]ebug [U]I Toggle',
        },
        {
            '<leader>de',
            function()
                require('dapui').eval()
            end,
            mode = { 'n', 'v' },
            desc = '[D]ebug [E]valuate Expression',
        },
        {
            '<leader>dk',
            function()
                require('dap').repl.toggle()
            end,
            desc = '[D]ebug REPL Too[K]le',
        },
        {
            '<leader>df',
            function()
                require('dap').focus_frame()
            end,
            desc = '[D]ebug Focus [F]rame',
        },
        {
            '<leader>dw',
            function()
                require('dap.ui.widgets').hover()
            end,
            desc = '[D]ebug [W]idgets Hover',
        },
    },
    config = function()
        local dap, dapui = require 'dap', require 'dapui'

        -- Setup DAP UI
        dapui.setup()

        -- Automatically open/close DAP UI
        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
        end

        vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
    end,
}
