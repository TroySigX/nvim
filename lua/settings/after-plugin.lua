local path = require('utils.path')
local opt = vim.opt

opt.undodir = path.join(vim.fn.stdpath('data'), '.undodir')
opt.undofile = true

-- auto indent on newline
local function auto_indent(mode)
  if #vim.fn.getline('.') == 0 then
    return [["_cc]]
  else
    return mode
  end
end
local insertModes = { 'i', 'a', 'A' }
for _, mode in pairs(insertModes) do
  vim.keymap.set('n', mode, function()
    return auto_indent(mode)
  end, { desc = 'auto indent on newline in insert mode', expr = true })
end

-- diagnostic
vim.diagnostic.config({
  severity_sort = true,
  signs = {
    severity = { min = vim.diagnostic.severity.WARN },
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
  },
})

-- restore cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(opts)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if
          not (ft:match('commit') and ft:match('rebase'))
          and last_known_line > 1
          and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
        then
          vim.api.nvim_feedkeys([[g`"]], 'nx', false)
        end
      end,
    })
  end,
})
