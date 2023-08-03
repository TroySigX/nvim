local path = require('lspconfig.util').path
local opt = vim.opt

opt.undodir = path.join(vim.fn.stdpath('data'), '.undodir')
opt.undofile = true
