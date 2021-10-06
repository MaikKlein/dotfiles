require("telescope").setup({
	--extensions = {
	--     fzf_writer = {
	--         minimum_grep_characters = 2,
	--         minimum_files_characters = 2,

	--         -- Disabled by default.
	--         -- Will probably slow down some aspects of the sorter, but can make color highlights.
	--         -- I will work on this more later.
	--         use_highlighter = true,
	--     }
	-- }
})

local opt = { noremap = true, silent = true }


-- mappings
-- vim.api.nvim_set_keymap("n", "<Leader>pf", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>pf", [[<Cmd>lua require('telescope').extensions.fzf_writer.files()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>pb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fr", [[<Cmd>lua require('telescope.builtin').reloader()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>gb", [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], opt)
