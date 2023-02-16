for dir in io.popen([[ls ~/.config/nvim/lua/*.lua]]):lines() do
   require(dir:match("^.*/(.*).lua$"))
end

