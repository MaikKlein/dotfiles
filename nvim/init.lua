vim.cmd("source ~/.config/nvim/lua/fzf-binds.vim")
require("pluginList")
require("options")
require("autocommands")
-- load all plugins
require("whichkey")

require("statusline")
--
require("colorizer").setup()
require("plenary")
require("neogit")
require('nvim-autopairs').setup{}

-- lsp stuff
require("nvim-lspconfig")
require("compe-completion")

require("treesitter-nvim")
require("mappings")

require("telescope-nvim")
require("nvimTree") -- file tree stuff
require("file-icons")

require("nvim-autopairs").setup()

require("lspkind").init()

require("lsp_signature").setup({})
require("lspsaga")
