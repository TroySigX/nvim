local M = {}

function M.setup()
  require('fzf-lua').setup()
end

function M.keymaps()
  require('which-key').register({
    gr = { function() require('fzf-lua').live_grep() end, 'Live [Gr]ep' },
    sw = { function() require('fzf-lua').grep_cword() end, '[S]earch [W]ord' },
    km = { function() require('fzf-lua').keymaps() end, '[K]ey[M]aps' },
  }, { prefix = '<space>' })

  require('which-key').register({
    ['<F6>'] = { function() require('fzf-lua').files() end, 'Find files' },
    ['<F18>'] = { function() require('fzf-lua').oldfiles() end, 'Old files' },
  }, { mode = { 'n', 'v', 'i' } })
end

return M
