local M = {}

function M.keymaps()
  require('utils.keymaps').add_keymap({
    '<space>ll',
    function()
      require('lint').try_lint()
    end,
    '[L]sp [L]int',
    mode = { 'n', 'x' },
  })
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
