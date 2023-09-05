local M = {}

local exclude_ft = {}

local function ignore_ft()
  for _, v in ipairs(vim.g.exclude_filetypes) do
    exclude_ft[v] = true
  end
end

function M.setup()
  vim.o.foldcolumn = '1'
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

  local builtin = require('statuscol.builtin')
  require('statuscol').setup({
    relculright = true,
    segments = {
      { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
      { text = { '%s' }, click = 'v:lua.ScSa' },
      { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
    },
  })

  ignore_ft()

  require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
      if exclude_ft[filetype] then
        return ''
      end

      return { 'treesitter', 'indent' }
    end,
  })
end

return M
