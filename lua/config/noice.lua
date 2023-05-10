require('noice').setup({
  cmdline = {
    view = 'cmdline',
  },
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = false,
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = false,
  },
  commands = {
    viewLast = {
      view = 'split',
      opts = { enter = true, format = 'details' },
      filter = {},
      filter_opts  = {count = 2}
    },
    all = {
      view = 'split',
      opts = { enter = true, format = 'details' },
      filter = {},
    },
  },
})

local map = vim.keymap.set
map('n', '<space>h', function() require('noice').cmd('viewLast') end, { desc = 'Noice view last' })
