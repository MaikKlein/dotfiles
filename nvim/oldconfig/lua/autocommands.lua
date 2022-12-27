vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
-- For transparent background
vim.cmd([[autocmd ColorScheme * hi clear CursorLine]])
vim.cmd([[au FileType rust let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '`':'`', '|':'|', '<':'>'}]])
