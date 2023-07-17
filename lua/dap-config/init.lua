local function setup_adapter(ft)
  require('dap-config.' .. ft).setup()
end

local langs = { 'js' }

for _, lang in pairs(langs) do
  setup_adapter(lang)
end
