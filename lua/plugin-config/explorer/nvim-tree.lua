local M = {}

-- maps tabpage with win id that opens nvim-tree
local open_win = {}

local function map_win_id()
  local current_tab = vim.api.nvim_get_current_tabpage()
  local current_win_id = vim.fn.win_getid()

  open_win[current_tab] = current_win_id
end

local function opts(bufnr)
  return { buffer = bufnr, nowait = true }
end

function M.setup()
  local map = vim.keymap.set
  local unmap = vim.keymap.del
  local api = require('nvim-tree.api')

  local function open_tab_silent(node)
    api.node.open.tab(node)
    vim.cmd.tabprev()
  end

  local function open_tab(node)
    api.node.open.tab(node)
    vim.cmd.tabprev()
    api.tree.close()
    vim.cmd.tabnext()
  end

  local function goto_buffer_cwd()
    local current_tab = vim.api.nvim_get_current_tabpage()
    vim.fn.win_gotoid(open_win[current_tab])
    api.tree.find_file({ open = true, update_root = true, focus = true })
  end

  require('nvim-tree').setup({
    disable_netrw = true,

    on_attach = function(bufnr)
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      unmap('n', '<C-t>', { buffer = bufnr })
      map('n', '<C-t>', open_tab, opts(bufnr))
      map('n', 'T', open_tab_silent, opts(bufnr))
      map('n', 'CD', goto_buffer_cwd, opts(bufnr))
      map('n', '<C-s>', api.node.open.horizontal, opts(bufnr))
    end,

    git = {
      ignore = false,
    },

    view = {
      relativenumber = true,
    },
  })
end

function M.keymaps()
  require('which-key').register({
    ['<F2>'] = { function()
      local api = require('nvim-tree.api')
      if api.tree.is_visible() then
        api.tree.close()
      else
        map_win_id()
        api.tree.open()
      end
      -- vim.cmd.stopinsert()
      -- api.tree.toggle()
    end, 'Toggle Tree (file explorer)' },
  }, { mode = { 'n', 'i', 'v' } })
end

return M
