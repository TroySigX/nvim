local M = {}

function M.keymaps()
  require('which-key').register({
    t = {
      function()
        require('flash').jump({
          jump = {
            autojump = true,
          },
        })
      end,
      'go [t]o word forward (word after cursor)',
    },
    T = {
      function()
        require('flash').jump({
          search = { forward = false, wrap = false, multi_window = false },
          jump = {
            autojump = true,
          },
        })
      end,
      'go [T]o word backward (word before cursor)',
    },
  }, { mode = { 'n', 'x' } })
end

function M.setup()
  require('flash').setup({
    modes = {
      char = {
        enabled = false,
      },
    },
  })
end

return M
