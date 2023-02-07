require('trouble').setup {}
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local map = vim.keymap.set
local opts = { silent = true }

map('n', '<F1>', ":TroubleToggle<CR>", { desc = 'Toggle Trouble List', unpack(opts) })
map('i', '<F1>', "<Esc>:TroubleToggle<CR>", { desc = 'Toggle Trouble List', unpack(opts) })
map('v', '<F1>', "<Esc>:TroubleToggle<CR>", { desc = 'Toggle Trouble List', unpack(opts) })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show [E]rrors on line' })
map('n', '<C-k>', vim.diagnostic.goto_prev, { desc = 'Go To Previous Error' })
map('n', '<C-j>', vim.diagnostic.goto_next, { desc = 'Go To Next Error' })
