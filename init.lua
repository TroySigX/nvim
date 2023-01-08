for dir in io.popen([[ls ~/.config/nvim/lua/*.lua]]):lines() do
    dofile(dir)
end
