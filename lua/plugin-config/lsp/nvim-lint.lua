local M = {}

function M.keymaps()
  require('which-key').register({
    l = {
      l = { function() require('lint').try_lint() end, '[L]sp [L]int' },
    },
  }, { prefix = '<space>', mode = { 'n', 'v' } })
end

function M.setup()
  require('lint').linters_by_ft = {
    sh = { 'shellcheck' },
    json = { 'jsonlint' },
    javascript = { 'eslint_d' },
    typescript = { 'eslint_d' },
  }
end

return M
