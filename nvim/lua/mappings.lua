local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}
-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them!
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

 this line too ]]
map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- term newtab
map("n", "<leader>fer", [[<Cmd> lua require('plenary').reload_modules()<CR>]], opt) -- term newtab

-- COPY EVERYTHING --
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers ---
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- toggle truezen.nvim's ataraxis and minimalist mode
map("n", "<leader>z", [[ <Cmd> TZAtaraxis<CR>]], opt)
map("n", "<leader>m", [[ <Cmd> TZMinimalist<CR>]], opt)

map("n", "<C-s>", [[ <Cmd> w <CR>]], opt)

for i = 1, 9 do
	map("n", "<leader>o" .. i, i .. "gt", opt)
	map("n", "<leader>om" .. i, ":tabm" .. i .. "<CR>", opt)
	map("n", "<leader>" .. i, ":" .. i .. "wincmd w<CR>", opt)
end

map("n", "<leader>od", ":tabclose<CR>", opt)
map("n", "<leader>oc", ":tabnew<CR>:tabmove<CR>", opt)
map("n", "<leader>sc", ":noh<CR>", opt)
map("i", "<C-s>", "<esc>:w<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<leader>gs", ":Git<CR>", opt)

map("n", "<leader>ls", ":FindSymbols<CR>", opt)
map("n", "<leader>lf", ":FindFunctions<CR>", opt)
map("n", "<leader>li", ":FindImpls<CR>", opt)

map("n", "<leader>y", '"+y', opt)
map("v", "<leader>y", '"+y', opt)

map("n", "<leader>ca", ":Lspsaga code_action<CR>", opt)
map("v", "<leader>ca", ":Lspsaga range code_action<CR>", opt)
map("n", "gp", ":Lspsaga preview_definition<CR>", opt)

map("n", "<leader>el", ":TroubleToggle<CR>", opt)
map("n", "<leader>ee", ":Lspsaga show_line_diagnostics<CR>", opt)
map("n", "<leader>gc", ":Git commit -v -q<CR>", opt)
