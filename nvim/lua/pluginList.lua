local packer = require("packer")
local use = packer.use
vim.api.nvim_command([[autocmd BufWritePost pluginList.lua PackerCompile]])

-- using { } for using different branch , loading plugin with certain commands etc
return require("packer").startup(function()

	use("wbthomason/packer.nvim")
    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

	-- color related stuff
	use("siduck76/nvim-base16.lua")
	use("norcalli/nvim-colorizer.lua")
	use("ishan9299/nvim-solarized-lua")

	-- lang stuff
	use("nvim-treesitter/nvim-treesitter")
    use 'nvim-treesitter/nvim-treesitter-context'
	use("neovim/nvim-lspconfig")
    --use('glepnir/lspsaga.nvim')
	-- use("hrsh7th/nvim-compe")
    use({
        "ggandor/leap.nvim",
		config = function()
			require("leap").setup({
			})
		end,
    })
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
	use("onsails/lspkind-nvim")
	use("sbdchd/neoformat")
	use("nvim-lua/plenary.nvim")
    use('williamboman/nvim-lsp-installer')
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
	use("nvim-lua/lsp_extensions.nvim")
    use({
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    })
	use("ray-x/lsp_signature.nvim")
	use("kosayoda/nvim-lightbulb")
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use("beyondmarc/hlsl.vim")
	use({
		"folke/trouble.nvim",
		--requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
			})
		end,
	})
    use("gfanto/fzf-lsp.nvim")

	use("akinsho/nvim-bufferline.lua")
	use("windwp/nvim-autopairs")
    use("jiangmiao/auto-pairs")
	use("alvan/vim-closetag")
    use("tpope/vim-surround")

	use("kburdett/vim-nuuid")
	--use("thaerkh/vim-workspace")
	-- snippet support
	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")

	-- file managing , picker etc
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	--use("ryanoasis/vim-devicons")
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
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use("lukas-reineke/indent-blankline.nvim")
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb")
	use("sindrets/diffview.nvim")
	use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
	--use("junegunn/fzf.vim")
    use{
        "MaikKlein/fzf.vim",
        branch = "test"
    }
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
