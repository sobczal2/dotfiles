return function()
    if vim.bo.modifiable and not vim.bo.readonly then
        vim.cmd 'silent! write'
    end
end
