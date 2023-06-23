local rainbow = require 'ts-rainbow'

require('nvim-treesitter.configs').setup({
  rainbow = {
    enable = true,
    query = {
       'rainbow-parens'
    },
    extended_mode = true,
    strategy = rainbow.strategy.global,
    hlgroups = {
       'TSRainbowBlue',
       'TSRainbowViolet',
       'TSRainbowOrange',
       'TSRainbowGreen',
       'TSRainbowYellow',
       'TSRainbowRed',
       'TSRainbowCyan',
    },
  }
})