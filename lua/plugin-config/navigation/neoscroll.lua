local M = {}

function M.keymaps()
  return { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' }
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
