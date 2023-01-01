lua << EOF

local function open_tab_silent(node)
  local api = require("nvim-tree.api")

  api.node.open.tab(node)
  vim.cmd.tabprev()

end

local function goto_cwd()
  vim.cmd("wincmd l")
  vim.cmd("NvimTreeFindFile")
  vim.cmd("wincmd h")
end

require("nvim-tree").setup({
  disable_netrw = false,
  view = {
    mappings = {
      list = {
        { key = "T", action = "open_tab_silent", action_cb = open_tab_silent },
        { key = "CD", action = "goto_cwd", action_cb = goto_cwd },
      },
    }
  }
})

EOF

map <silent> <F2> <Esc>:NvimTreeToggle<CR>
imap <silent> <F2> <Esc>:NvimTreeToggle<CR>
tmap <silent> <F2> <Esc>:NvimTreeToggle<CR>
