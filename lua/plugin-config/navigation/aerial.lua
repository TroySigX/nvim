local M = {}

function M.setup()
  -- enable relative line number
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'aerial' },
    callback = function()
      vim.schedule(function()
        vim.cmd('set relativenumber')
      end)
    end,
  })

  require('aerial').setup({
    layout = {
      max_width = 0.25,
      min_width = 0.23,
    },
  })
end

function M.keymaps()
  require('which-key').register({
    ['<F4>'] = {
      function()
        require('aerial').toggle()
      end,
      'Toggle Aerial (code outline)',
    },
  }, { mode = { 'n', 'x', 'i' } })
end

return M
