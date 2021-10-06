local packer = require("packer")
local use = packer.use
vim.api.nvim_command([[autocmd BufWritePost pluginList.lua PackerCompile]])

-- using { } for using different branch , loading plugin with certain commands etc
return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- color related stuff
	use("siduck76/nvim-base16.lua")
	use("norcalli/nvim-colorizer.lua")
	use("ishan9299/nvim-solarized-lua")

	-- lang stuff
	use("nvim-treesitter/nvim-treesitter")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-compe")
	use("onsails/lspkind-nvim")
	use("sbdchd/neoformat")
	use("nvim-lua/plenary.nvim")
	use("kabouzeid/nvim-lspinstall")
	use("nvim-lua/lsp_extensions.nvim")
	use("glepnir/lspsaga.nvim")
	use("ray-x/lsp_signature.nvim")
	use("simrat39/symbols-outline.nvim")
	use("kosayoda/nvim-lightbulb")
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("Pocco81/DAPInstall.nvim")
	use("simrat39/rust-tools.nvim")
    use("beyondmarc/hlsl.vim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
			})
		end,
	})

	use("akinsho/nvim-bufferline.lua")
	use("windwp/nvim-autopairs")
    use("jiangmiao/auto-pairs")
	use("alvan/vim-closetag")
    use("tpope/vim-surround")

	use("kburdett/vim-nuuid")
	use("thaerkh/vim-workspace")
	-- snippet support
	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")

	-- file managing , picker etc
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use("ryanoasis/vim-devicons")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-lua/popup.nvim")

	-- misc
	use("rmagatti/auto-session")
	use("tweekmonster/startuptime.vim")
	use("907th/vim-auto-save")
	use("karb94/neoscroll.nvim")
	use("kdav5758/TrueZen.nvim")
	use("folke/which-key.nvim")
	use("nvim-telescope/telescope-fzf-writer.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb")
	use("sindrets/diffview.nvim")
	use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
	use("junegunn/fzf.vim")
	use({
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
	})
	use("hoob3rt/lualine.nvim")
	-- themes
	use("sainnhe/sonokai")
	use("folke/tokyonight.nvim")
	use("Th3Whit3Wolf/one-nvim")
end, {
	display = {
		border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
	},
})
