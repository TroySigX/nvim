require('lint').linters_by_ft = {
  sh = { 'shellcheck' },
  json = { 'jsonlint' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})
