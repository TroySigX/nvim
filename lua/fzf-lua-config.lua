local map = vim.keymap.set
map('n', '<F6>', require('fzf-lua').files, { desc = 'Find files' })
map('i', '<F6>', require('fzf-lua').files, { desc = 'Find files' })
map('v', '<F6>', require('fzf-lua').files, { desc = 'Find files' })
map('t', '<F6>', require('fzf-lua').files, { desc = 'Find files' })

map('n', '<F18>', require('fzf-lua').oldfiles, { desc = 'Old files' })
map('i', '<F18>', require('fzf-lua').oldfiles, { desc = 'Old files' })
map('v', '<F18>', require('fzf-lua').oldfiles, { desc = 'Old files' })
map('t', '<F18>', require('fzf-lua').oldfiles, { desc = 'Old files' })

map('n', '<space>gr', require('fzf-lua').live_grep, { desc = 'Live [Gr]ep' })
map('n', '<space>sw', require('fzf-lua').grep_cword, { desc = '[S]earch [W]ord' })
map('n', '<space>km', require('fzf-lua').keymaps, { desc = '[K]ey[M]aps' })

local img_previewer = { "ueberzug" }

require("fzf-lua").setup({
    previewers = {
        builtin = {
            ueberzug_scaler = "cover",
            extensions = {
                ["gif"] = img_previewer,
                ["png"] = img_previewer,
                ["jpg"] = img_previewer,
                ["jpeg"] = img_previewer,
            },
        },
    },
})
