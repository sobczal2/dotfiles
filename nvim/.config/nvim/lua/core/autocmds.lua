local save_if_writable = require '../scripts/save-if-writable'

vim.api.nvim_create_augroup('AutoSaveOnNormalEnter', { clear = true })
vim.api.nvim_create_autocmd('ModeChanged', {
    group = 'AutoSaveOnNormalEnter',
    pattern = '*:n',
    callback = save_if_writable,
})
