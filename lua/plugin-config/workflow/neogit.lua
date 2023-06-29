local M = {}

function M.setup()
  require('neogit').setup {
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = true,
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = false,
    kind = 'tab',
    console_timeout = 2000,
    auto_show_console = true,
    popup = {
      kind = 'vsplit',
    },
    signs = {
      -- { CLOSED, OPENED }
      section = { '>', 'v' },
      item = { '>', 'v' },
      hunk = { '', '' },
    },
    integrations = {
      diffview = true
    },
    sections = {
      untracked = {
        folded = false
      },
      unstaged = {
        folded = false
      },
      staged = {
        folded = false
      },
      stashes = {
        folded = true
      },
      unpulled = {
        folded = true
      },
      unmerged = {
        folded = false
      },
      recent = {
        folded = true
      },
    },
  }
end

function M.keymaps()
  require('which-key').register({
    ['<F10>'] = { function() require('neogit').open() end, 'Open Neogit' },
  }, { mode = { 'n', 'v', 'i' } })
end

return M
