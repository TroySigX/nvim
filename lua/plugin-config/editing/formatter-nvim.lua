local M = {}

local autoformat = true

local function toggle_autoformat()
  autoformat = not autoformat
end

function M.keymaps()
  return {
    { '<space>fr', vim.cmd.Format, silent = true, desc = '[F]ormat Code [R]un', mode = { 'n', 'v' } },
    { '<space>ft', toggle_autoformat, desc = '[F]ormat [T]oggle' },
  }
end

local formatters_for_filetype = {
  lua = {
    mason = 'stylua',
    formatter = 'stylua',
  },
  typescript = {
    mason = 'prettierd',
    formatter = 'prettierd',
  },
  javascript = {
    mason = 'prettierd',
    formatter = 'prettierd',
  },
  python = {
    mason = 'black',
    formatter = 'black',
  },
  cpp = {
    mason = 'clang-format',
    formatter = 'clangformat',
  },
  c = {
    mason = 'clang-format',
    formatter = 'clangformat',
  },
  tex = {
    mason = 'latexindent',
    formmason = 'latexindent',
  },
}

local function available_formatters()
  local filetype_formatters = {}

  for ft, fmt in pairs(formatters_for_filetype) do
    if require('mason-registry').is_installed(fmt['mason']) then
      filetype_formatters[ft] = {
        require('formatter.filetypes.' .. (ft == 'tex' and 'la' or '') .. ft)[fmt['formatter']],
      }
    end
  end

  return filetype_formatters
end

local function formatting_notify()
  vim.api.nvim_create_autocmd('User', {
    pattern = 'FormatterPre',
    callback = function()
      vim.notify('Formatting code...', vim.log.levels.INFO)
    end,
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'FormatterPost',
    callback = function()
      vim.notify('Formatting done', vim.log.levels.INFO)
    end,
  })
end

function M.setup()
  require('formatter').setup({
    filetype = available_formatters(),
  })

  -- notify on format
  formatting_notify()

  -- auto format on save
  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*',
    callback = function()
      if autoformat and not Knap_autopreview() then
        vim.cmd([[FormatWriteLock]])
      end
    end,
  })
end

return M
