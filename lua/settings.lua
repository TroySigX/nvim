local opt = vim.opt
opt.termguicolors = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.clipboard:append('unnamedplus')
opt.signcolumn = 'yes'
opt.syntax = 'on'
opt.showmatch = true
opt.updatetime = 300
opt.list = true
opt.cursorline = true
opt.exrc = true

-- default filetype for latex is tex
vim.g.tex_flavor = 'latex'

-- auto indent on newline
local function auto_indent(mode)
  if #vim.fn.getline '.' == 0 then
    return [["_cc]]
  else
    return mode
  end
end
local insertModes = { 'i', 'a', 'A' }
for _, mode in pairs(insertModes) do
  vim.keymap.set('n', mode, function() return auto_indent(mode) end, { desc = 'auto indent on newline in insert mode', expr = true })
end

-- set signs
local signs = {
  { name = 'DiagnosticSignError', text = '' },
  { name = 'DiagnosticSignWarn', text = '' },
  { name = 'DiagnosticSignHint', text = '' },
  { name = 'DiagnosticSignInfo', text = '' },
}
for _, sign in pairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

-- diagnostic severity
vim.diagnostic.config({
  virtual_text = false,
  signs = { severity = vim.diagnostic.severity.ERROR }
})
