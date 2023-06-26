require('which-key').register({
  gr = { require('fzf-lua').live_grep, 'Live [Gr]ep' },
  sw = { require('fzf-lua').grep_cword, '[S]earch [W]ord' },
  km = { require('fzf-lua').keymaps, '[K]ey[M]aps' },
}, { prefix = '<space>' })

require('which-key').register({
  ['<F6>'] = { require('fzf-lua').files, 'Find files' },
  ['<F18>'] = { require('fzf-lua').oldfiles, 'Old files' },
}, { mode = { 'n', 'v', 'i' } })
