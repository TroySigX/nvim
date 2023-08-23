local M = {}

function M.keymaps()
  require('which-key').register({
    p = {
      name = 'package info',
      t = {
        function()
          require('package-info').toggle()
        end,
        '[P]ackage info [T]oggle',
      },
      u = {
        function()
          require('package-info').update()
        end,
        '[P]ackage [U]pdate',
      },
      d = {
        function()
          require('package-info').delete()
        end,
        '[P]ackage [D]elete',
      },
      i = {
        function()
          require('package-info').install()
        end,
        '[P]ackage [I]nstall',
      },
      c = {
        function()
          require('package-info').change_version()
        end,
        '[P]ackage [C]hange version',
      },
    },
  }, { prefix = '<leader>' })
end

function M.setup()
  require('package-info').setup({
    colors = {
      up_to_date = '#3C4048',
      outdated = '#e09443',
    },
    autostart = false,
    hide_up_to_date = true,
  })
end

return M
