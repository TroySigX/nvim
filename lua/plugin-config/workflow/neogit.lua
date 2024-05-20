local M = {}

function M.setup()
  require('neogit').setup({
    kind = 'tab',
    auto_show_console = false,
    popup = {
      kind = 'vsplit',
    },
    commit_editor = {
      kind = 'split',
    },
    integrations = {
      diffview = true,
    },
  })
end

function M.keymaps()
  require('which-key').register({
    ['<F10>'] = {
      function()
        vim.cmd.stopinsert()
        require('neogit').open()
      end,
      'Open Neogit (manage git repo)',
    },
  }, { mode = { 'n', 'x', 'i' } })
end

return M
