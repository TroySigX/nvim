local M = {}

-- maps tabpage with win id that opens nvim-tree
local open_win = {}

local function map_win_id()
  local current_tab = vim.api.nvim_get_current_tabpage()
  local current_win_id = vim.fn.win_getid()

  open_win[current_tab] = current_win_id
end

--- pass to register mappings
local function opts(bufnr, desc)
  return { buffer = bufnr, nowait = true, desc = desc }
end

function M.setup()
  local map = vim.keymap.set
  local api = require('nvim-tree.api')

  local function is_directory()
    local node = api.tree.get_node_under_cursor()
    if node.type == 'directory' then
      return true
    end

    return false
  end

  local function open_tab_silent()
    -- if dir, expand
    if is_directory() then
      api.node.open.edit()
    else
      api.node.open.tab()
      vim.cmd.tabprev()
    end
  end

  local function open_tab()
    -- if dir, expand
    if is_directory() then
      api.node.open.edit()
    else
      api.node.open.tab()
      vim.cmd.tabprev()
      api.tree.close()
      vim.cmd.tabnext()
    end
  end

  local function goto_buffer_cwd()
    local current_tab = vim.api.nvim_get_current_tabpage()
    vim.fn.win_gotoid(open_win[current_tab])
    api.tree.find_file({ open = true, update_root = true, focus = true })
  end

  local function preview_file()
    -- if dir, expand
    if is_directory() then
      api.node.open.edit()
    else
      require('nvim-tree-preview').watch()
    end
  end

  -- for auto-update imports when renaming files
  require('lsp-file-operations').setup()

  -- for previewing files
  require('nvim-tree-preview').setup()

  require('nvim-tree').setup({
    disable_netrw = true,

    on_attach = function(bufnr)
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      map('n', '<C-t>', open_tab, opts(bufnr, 'open in new tab'))
      map('n', 'T', open_tab_silent, opts(bufnr, 'open in new tab without switching tab'))
      map('n', 'CD', goto_buffer_cwd, opts(bufnr, 'point to file explorer node of current window'))
      map('n', '<C-s>', api.node.open.horizontal, opts(bufnr, 'open file horizontally (split window)'))
      map('n', '?', api.tree.toggle_help, opts(bufnr, 'show help'))
      map('n', '<Tab>', preview_file, opts(bufnr, 'preview file'))
    end,

    git = {
      ignore = false,
    },

    view = {
      relativenumber = true,
    },
  })

  -- disable executable highlighting
  vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { fg = 'none', bg = 'none' })
end

function M.keymaps()
  require('which-key').register({
    ['<F2>'] = {
      function()
        vim.cmd.stopinsert()
        local api = require('nvim-tree.api')
        if api.tree.is_visible() then
          api.tree.close()
        else
          map_win_id()
          api.tree.open()
        end
      end,
      'Toggle Tree (file explorer)',
    },
  }, { mode = { 'n', 'i', 'x' } })
end

return M
