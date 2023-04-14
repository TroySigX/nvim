local map = vim.keymap.set
map('n', 'K', vim.lsp.buf.definition, { desc = 'LSP Definition' })
map('n', '<space>ca', vim.lsp.buf.code_action, { desc = 'LSP [C]ode [A]ction' })

function MasonLspPackages()
	local registry = require('mason-registry')
	local lsp = {}
	for _, pkg in ipairs(registry.get_installed_package_names()) do
		local pkg_info = registry.get_package(pkg)
		for _, type in ipairs(pkg_info.spec.categories) do
			if type == 'LSP' then
				table.insert(lsp, pkg_info.name)
			end
		end
	end
	return lsp
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('lspconfig')
local servers = MasonLspPackages()
for _, ls in ipairs(servers) do
  lsp[ls].setup{
    capabilities = capabilities
  }
end