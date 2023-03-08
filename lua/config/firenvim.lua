require('lazy').load({ plugins = 'firenvim', wait = true })
vim.fn['firenvim#install'](0)
vim.g.firenvim_config.localSettings['.*'] = { takeover = 'once' }
