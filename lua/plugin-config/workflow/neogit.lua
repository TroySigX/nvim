local M = {}

function M.setup()
  require('neogit').setup({
    disable_commit_confirmation = true,
    kind = 'tab',
    auto_show_console = false,
    popup = {
      kind = 'vsplit',
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
  }, { mode = { 'n', 'v', 'i' } })
end

return M
