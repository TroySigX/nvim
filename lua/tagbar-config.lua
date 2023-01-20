local map = vim.keymap.set
local bufopts = { silent = true }

map('n', '<F8>', function()
    vim.cmd("TagbarToggle")
    vim.cmd("wincmd l")
end
, { desc = "Toggle Tagbar", unpack(bufopts) })
map('i', '<F8>', function()
    vim.cmd.stopinsert()
    vim.cmd("TagbarToggle")
    vim.cmd("wincmd l")
end
, { desc = "Toggle Tagbar", unpack(bufopts) })
map('v', '<F8>', function()
    vim.cmd.stopinsert()
    vim.cmd("TagbarToggle")
    vim.cmd("wincmd l")
end
, { desc = "Toggle Tagbar", unpack(bufopts) })
