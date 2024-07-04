local M = {}

function M.setup()
  vim.api.nvim_set_hl(0, 'FzfLuaBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'FzfLuaTitle', { link = 'Special' })
  require('fzf-lua').setup()
end

function M.keymaps()
  local map = require('which-key').register
  map({
    g = {
      r = {
        function()
          require('fzf-lua').live_grep()
        end,
        'Live [Gr]ep',
      },
      R = {
        function()
          require('fzf-lua').live_grep_resume()
        end,
        '[G]rep [R]esume',
      },
    },
    sw = {
      function()
        require('fzf-lua').grep_cword()
      end,
      '[S]earch [W]ord',
    },
    km = {
      function()
        require('fzf-lua').keymaps()
      end,
      '[K]ey[M]aps',
    },
  }, { prefix = '<space>' })

  map({
    sw = {
      function()
        require('fzf-lua').grep_visual()
      end,
      '[S]earch Selected [W]ord',
    },
  }, { prefix = '<space>', mode = 'x' })

  map({
    ['<F6>'] = {
      function()
        require('fzf-lua').files()
      end,
      'Find files',
    },

    ['<F18>'] = {
      function()
        require('fzf-lua').resume()
      end,
      'Resume last fzf command (<S-F6>)',
    },
    ['<F30>'] = {
      function()
        require('fzf-lua').oldfiles()
      end,
      'Old files (<C-F6>)',
    },
  }, { mode = { 'n', 'x', 'i' } })

  map({
    ['?'] = {
      function()
        require('fzf-lua').grep_curbuf()
      end,
      'Grep current buffer',
    },
  }, { mode = { 'n', 'x' } })
end

return M
