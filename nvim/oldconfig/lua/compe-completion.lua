-- Setup nvim-cmp.
local cmp = require'cmp'
vim.o.completeopt = "menu,menuone,noselect"

cmp.setup({
  --snippet = {
  --  -- REQUIRED - you must specify a snippet engine
  --  expand = function(args)
  --    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  --    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
  --    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --  end,
  --},
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete({}),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['rust_analyzer'].setup {
--  capabilities = capabilities
--}
--vim.o.completeopt = "menuone,noselect"
--
--require("compe").setup({
--	enabled = true,
--	autocomplete = true,
--	debug = false,
--	min_length = 1,
--	preselect = "enable",
--	throttle_time = 80,
--	source_timeout = 200,
--	incomplete_delay = 400,
--	max_abbr_width = 100,
--	max_kind_width = 100,
--	max_menu_width = 100,
--	documentation = true,
--	source = {
--		buffer = { kind = "﬘", true },
--		vsnip = { kind = "﬌" }, --replace to what sign you prefer
--		nvim_lsp = true,
--		path = true,
--	},
--})
--
--local t = function(str)
--	return vim.api.nvim_replace_termcodes(str, true, true, true)
--end
--
--local check_back_space = function()
--	local col = vim.fn.col(".") - 1
--	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
--		return true
--	else
--		return false
--	end
--end
--
---- tab completion
--
--_G.tab_complete = function()
--	if vim.fn.pumvisible() == 1 then
--		return t("<C-n>")
--	elseif check_back_space() then
--		return t("<Tab>")
--	else
--		return vim.fn["compe#complete"]()
--	end
--end
--_G.s_tab_complete = function()
--	if vim.fn.pumvisible() == 1 then
--		return t("<C-p>")
--	elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
--		return t("<Plug>(vsnip-jump-prev)")
--	else
--		return t("<S-Tab>")
--	end
--end
--
----  mappings
--
--vim.api.nvim_set_keymap("i", "<C-SPACE>", "compe#complete()", { expr = true, silent = true })
--vim.api.nvim_set_keymap("i", "<CR>", [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()))]], { expr = true, silent = true })
----vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { expr = true, silent = true })
--vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
--vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
--vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
--vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
--
--function _G.completions()
--	local npairs = require("nvim-autopairs")
--	if vim.fn.pumvisible() == 1 then
--		if vim.fn.complete_info()["selected"] ~= -1 then
--			return vim.fn["compe#confirm"]("<CR>")
--		end
--	end
--	return npairs.check_break_line_char()
--end
--
--vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", { expr = true })
