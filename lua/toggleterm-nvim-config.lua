local map = vim.keymap.set
local bufopts = { silent = true }

local toggleTerm = function()
    local api = vim.api
    -- check if buffer is modifiable
    local buf = api.nvim_win_get_buf(0)
    if not vim.bo[buf].readonly then
        api.nvim_command('write')
    end

    api.nvim_command('ToggleTerm')
end

map('n', '<F9>', toggleTerm, { desc = 'Toggle Terminal', unpack(bufopts) })
map({ 'i', 'v' }, '<F9>', function()
    vim.cmd.stopinsert()
    toggleTerm()
end, { desc = 'Toggle Term', unpack(bufopts) })
map('t', '<F9>', '<C-\\><C-N>:ToggleTerm<CR>', { desc = 'Toggle Term', unpack(bufopts) })

require('toggleterm').setup{
    direction = 'float',
    float_opts = {
        border = 'curved',
        width = 110,
        height = 35,
        winblend = 17,
    },
}
