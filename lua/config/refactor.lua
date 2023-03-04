require('refactoring').setup({
    prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
    },
    prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
    },
})

local map = vim.keymap.set
map('v', '<space>rf', function()
    require('refactoring').refactor('Extract Function')
end, { desc = '[R]efactor [F]unction' })
map('v', '<space>rv', function()
    require('refactoring').refactor('Extract Variable')
end, { desc = '[R]efactor [V]ariable' })
map({ 'n', 'v' }, '<space>ri', function()
    require('refactoring').refactor('Inline Variable')
end, { desc = '[R]efactor [I]nline' })
