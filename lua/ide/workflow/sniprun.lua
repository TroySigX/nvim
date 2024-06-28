local M = {}

function M.setup()
  require('sniprun').setup({
    display = {
      'Classic',
      'VirtualTextOk',
      'TempFloatingWindow',
      'NvimNotify',
    },
  })
end

function M.keymaps()
  require('which-key').register({
    ['<space>sr'] = {
      function()
        require('sniprun')
        vim.cmd.SnipRun()
      end,
      'Trigger [S]nip [R]un (run code runner)',
    },
  }, { mode = { 'n', 'x' } })

  require('which-key').register({
    ['<space>sc'] = {
      function()
        require('sniprun')
        vim.cmd.SnipClose()
      end,
      '[S]nip [C]lose (close code runner)',
    },
  })
end

return M
