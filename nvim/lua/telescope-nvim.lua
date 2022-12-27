require('telescope').setup {}

--require('telescope').load_extension('fzy_native')
--require('telescope').load_extension('fzf')

local opt = { noremap = true, silent = true }


-- mappings
-- vim.api.nvim_set_keymap("n", "<Leader>pf", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
--vim.api.nvim_set_keymap("n", "<Leader>pf", [[<Cmd>lua require('telescope').extensions.fzf_writer.files()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>pf", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>pb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fr", [[<Cmd>lua require('telescope.builtin').reloader()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>gb", [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], opt)
