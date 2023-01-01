lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local function open_tab_silent(node)
  local api = require("nvim-tree.api")

  api.node.open.tab(node)
  vim.cmd.tabprev()

end

require("nvim-tree").setup({
  view = {

    mappings = {
      list = {
        { key = "T", action = "open_tab_silent", action_cb = open_tab_silent },
      },
    }
  }
})

EOF

map <silent> <F2> <Esc>:NvimTreeToggle<CR>
imap <silent> <F2> <Esc>:NvimTreeToggle<CR>
tmap <silent> <F2> <Esc>:NvimTreeToggle<CR>
map <silent> CD :NvimTreeFindFile!<CR>
