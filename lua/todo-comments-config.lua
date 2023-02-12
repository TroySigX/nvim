require("todo-comments").setup()

local function toggle_quickfix_list()
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            vim.cmd.cclose()
            return
        end
    end

    vim.api.nvim_command('TodoQuickFix')
end

local map = vim.keymap.set
map('n', '<F3>', toggle_quickfix_list)
map({ 'i', 'v' }, '<F3>', function()
    vim.cmd.stopinsert()
    toggle_quickfix_list()
end)
