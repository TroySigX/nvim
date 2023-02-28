require('neotest').setup({
    adapters = {
        require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
                return vim.fn.getcwd()
            end,
        }),
    },

    quickfix = {
        open = false,
    }
})

local map = vim.keymap.set
map({ 'n', 'i', 'v' }, '<F4>', function()
    require('neotest').summary.toggle()
    vim.cmd('wincmd l')
end, { desc = 'Toggle Neotest Summary' })
map('n', '<leader>t', require('neotest').run.run, { desc = '[T]est Current Test' })
map('n', '<leader>at', function() require('neotest').run.run(vim.fn.expand("%")) end, { desc = 'Run [A]ll [T]est' })
