local M = {}

function M.setup()
  require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
  require('copilot_cmp').setup({ event = 'LspAttach' })

  local cmp = require('cmp')
  cmp.setup({
    formatting = {
      format = require('lspkind').cmp_format({
        mode = 'symbol_text',
        maxwidth = 50,
        ellipsis_char = '...',
        symbol_map = { Copilot = '' },
      }),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<CR>'] = cmp.mapping.confirm(),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),

    sources = {
      { name = 'nvim_lsp', priority = 1 },
      { name = 'buffer', priority = 1 },
      { name = 'nvim_lsp_signature_help', priority = 1 },
      { name = 'neorg', priority = 1 },
      { name = 'emoji', priority = 1 },
      { name = 'emmet', priority = 2 },
      { name = 'luasnip', priority = 2 },
      { name = 'copilot', priority = 2 },
    },

    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })
end

return M
