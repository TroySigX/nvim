local M = {}

function M.setup()
  vim.api.nvim_set_hl(0, 'FzfLuaBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'FzfLuaTitle', { link = 'Special' })
  require('fzf-lua').setup()
end

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  map({
    '<space>gr',
    function()
      require('fzf-lua').live_grep()
    end,
    'Live [Gr]ep',
  })

  map({
    '<space>gR',
    function()
      require('fzf-lua').live_grep_resume()
    end,
    '[G]rep [R]esume',
  })

  map({
    '<space>sw',
    function()
      require('fzf-lua').grep_cword()
    end,
    '[S]earch [W]ord',
  })

  map({
    '<space>km',
    function()
      require('fzf-lua').keymaps()
    end,
    '[K]ey[M]aps',
  })

  map({
    '<space>sw',
    function()
      require('fzf-lua').grep_visual()
    end,
    '[S]earch Selected [W]ord',
    mode = 'x',
  })

  map({
    '<F6>',
    function()
      require('fzf-lua').files()
    end,
    'Find files',
    mode = { 'n', 'x', 'i' },
  })
  map({
    '<F18>',
    function()
      require('fzf-lua').resume()
    end,
    'Resume last fzf command (<S-F6>)',
    mode = { 'n', 'x', 'i' },
  })
  map({
    '<F30>',
    function()
      require('fzf-lua').oldfiles()
    end,
    'Old files (<C-F6>)',
    mode = { 'n', 'x', 'i' },
  })

  map({
    '<leader>gbb',
    function()
      require('fzf-lua').git_blame()
    end,
    '[G]it [B]lame [B]uffer',
  })

  map({
    '?',
    function()
      require('fzf-lua').grep_curbuf()
    end,
    'Grep current buffer',
    mode = { 'n', 'x' },
  })
end

return M
