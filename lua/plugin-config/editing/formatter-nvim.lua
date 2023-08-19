local M = {}

function M.keymaps()
  return {
    { '<space>lf', vim.cmd.Format, silent = true, desc = '[L]sp [F]ormat Code', mode = { 'n', 'v' } },
  }
end

local formatters_for_filetype = {
  lua = 'stylua',
  typescript = 'prettierd',
  javascript = 'prettierd',
  python = 'black',
  cpp = 'clangformat',
  c = 'clangformat',
  tex = 'latexindent',
}

local function available_formatters()
  local filetype_formatters = {}

  for ft, fmt in pairs(formatters_for_filetype) do
    if require('mason-registry').is_installed(fmt) then
      filetype_formatters[ft] = {
        require('formatter.filetypes.' .. ft)[fmt],
      }
    end
  end

  return filetype_formatters
end

function M.setup()
  require('formatter').setup({
    filetype = available_formatters(),
  })

  -- auto format on save
  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*',
    callback = function()
      vim.cmd([[FormatWriteLock]])
    end,
  })
end

return M
