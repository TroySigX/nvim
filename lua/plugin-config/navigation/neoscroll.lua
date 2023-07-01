local M = {}

function M.keymaps(opts)
  local keys = {
    { key = '<C-u>', desc = 'Scroll up half page (move cursor)' },
    { key = '<C-d>', desc = 'Scroll down half page (move cursor)' },
    { key = '<C-b>', desc = 'Scroll 1 page up (move cursor)' },
    { key = '<C-f>', desc = 'Scroll 1 page down (move cursor)' },
    { key = '<C-y>', desc = 'Page up 3 lines (cursor stay in line)' },
    { key = '<C-e>', desc = 'Page down 3 lines (cursor stay in line)' },
    { key = 'zt', desc = 'Adjust cursor to top screen (cursor stay in line)' },
    { key = 'zz', desc = 'Adjust cursor to mid screen (cursor stay in line)' },
    { key = 'zb', desc = 'Adjust cursor to bottom screen (cursor stay in line)' },
  }

  local returned_keys = {}
  if opts ~= nil then
    for _, v in ipairs(keys) do
      local key = { v.key }
      for _, opt in ipairs(opts) do
        key[opt] = v[opt]
      end
      table.insert(returned_keys, key)
    end
  else
    for _, v in pairs(keys) do
      table.insert(returned_keys, v.key)
    end
  end

  return returned_keys
end

function M.setup()
  require('neoscroll').setup({
    mappings = M.keymaps(),
    hide_cursor = false,
    stop_eof = true,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    easing_function = nil,
    pre_hook = nil,
    post_hook = nil,
    performance_mode = false,
  })
end

return M
