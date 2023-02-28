require('dashboard').setup {
    theme = 'hyper',
    hide = {
        tabline = false,
    },
    config = {
        header = {
            '  ______                 _____ _      _  __',
            ' /_  __/________  __  __/ ___/(_)___ | |/ /',
            '  / / / ___/ __ \\/ / / /\\__ \\/ / __ `/   / ',
            ' / / / /  / /_/ / /_/ /___/ / / /_/ /   |  ',
            '/_/ /_/   \\____/\\__, //____/_/\\__, /_/|_|  ',
            '               /____/        /____/        '
        },
        packages = { enable = true },
        project = {
            limit = 5,
            icon = ' ',
            label = 'Recent Projects:',
            action = function(path)
                require('fzf-lua').files({ cwd = path })
            end
        },
        mru = {
            limit = 10,
            icon = ' ',
            label = 'Recent Files:'
        },
        shortcut = {
            { desc = ' Update', group = '@property', action = require('lazy').update, key = 'u' },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = require('fzf-lua').files,
                key = 'f',
            },
            { desc = ' Mason', group = '@property', action = 'Mason', key = 'm' },
        },
    },
}

