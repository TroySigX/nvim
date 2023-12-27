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

function M.select(prompt, items)
  local co = coroutine.running()

  vim.ui.select(items, {
    prompt = prompt,
  }, function(choice)
    coroutine.resume(co, choice)
  end)

  return coroutine.yield()
end

return M
