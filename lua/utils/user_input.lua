local M = {}

function M.input(prompt, default)
  if default == nil then
    default = ''
  end
  local co = coroutine.running()

  vim.ui.input({
    prompt = prompt,
    default = default,
  }, function(input)
    coroutine.resume(co, input)
  end)

  return coroutine.yield()
end

return M
