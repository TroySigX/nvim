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
local opts = { silent = true, noremap = true }

map('n', '<F1>', ":TroubleToggle<CR>", opts)
map('i', '<F1>', "<Esc>:TroubleToggle<CR>", opts)
map('v', '<F1>', "<Esc>:TroubleToggle<CR>", opts)
map('n', 'E', vim.diagnostic.open_float, opts)
map('n', '<C-k>', vim.diagnostic.goto_prev, opts)
map('n', '<C-j>', vim.diagnostic.goto_next, opts)
