local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local vim = vim
local g = vim.g
local cmd = vim.cmd

vim.o.ruler = false
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.cul = true
vim.o.mouse = "a"
vim.o.signcolumn = "no"
vim.o.cmdheight = 1
vim.o.updatetime = 250 -- update interval for gitsigns
vim.o.timeoutlen = 400
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.expandtab = true
vim.o.smartindent = true
vim.opt.whichwrap:append("<>hl")
vim.o.pumheight = 20
vim.o.foldmethod = "manual"
vim.o.list = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.syntax = "on"
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.virtualedit = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.sessionoptions = "curdir,winpos,winsize,tabpages,globals"
vim.o.tm = 2000
vim.o.smarttab = true
vim.o.background = "dark"
vim.o.breakindent = true

g.mapleader = " "
g.auto_save = 0
g.backspace = "eol,start,indent"
g.whichwrap = "<,>,h,l"

local mycolorscheme = 'tokyonight'

cmd("set noswapfile")

for i = 1, 9 do
    vim.keymap.set("n", "<leader>o" .. i, i .. "gt", { desc = 'Go to Tab ' .. i })
    vim.keymap.set("n", "<leader>om" .. i, ":tabm" .. i .. "<CR>", {})
    vim.keymap.set("n", "<leader>" .. i, ":" .. i .. "wincmd w<CR>", {})
end

vim.keymap.set("n", "<leader>od", ":tabclose<CR>", {})
vim.keymap.set("n", "<leader>oc", ":tabnew<CR>:tabmove<CR>", {})

vim.keymap.set("n", "<leader>sc", ":noh<CR>", {})
vim.keymap.set("i", "<C-s>", "<esc>:w<CR>", {})
vim.keymap.set("n", "<C-s>", ":w<CR>", {})

vim.keymap.set("n", "D", "<C-d>", {})
vim.keymap.set("n", "U", "<C-u>", {})

vim.keymap.set("n", "{", "[{", {})
vim.keymap.set("n", "}", "]}", {})

vim.keymap.set("n", "(", "[(", {})
vim.keymap.set("n", ")", "])", {})

vim.keymap.set("n", "<leader>y", '"+y', {})
vim.keymap.set("v", "<leader>y", '"+y', {})

vim.keymap.set('n', '<leader>vr', ':source $MYVIMRC<CR>', {})
vim.keymap.set('n', '<leader>vq', ':wqa!<CR>', {})
vim.keymap.set('n', '<leader>voc', ':e $MYVIMRC<CR>', {})

vim.keymap.set("v", "<C-DOWN>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-UP>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "i", "c" }, "<C-v>", '<c-r>+')

vim.keymap.set("n", "<C-o>", "<C-o>zz")

require("lazy").setup({
    "folke/tokyonight.nvim",
    'nyoom-engineering/oxocarbon.nvim',
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    -- { "folke/neoconf.nvim", cmd = "Neoconf" },
    { "folke/neodev.nvim",
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',

            'nvim-telescope/telescope.nvim',
            'SmiteshP/nvim-navic',
            'lvimuser/lsp-inlayhints.nvim'
        },
        config = function()
            -- LSP settings.
            --  This function gets run when an LSP connects to a particular buffer.
            local on_attach = function(client, bufnr)
                -- NOTE: Remember that lua is a real programming language, and as such it is possible
                -- to define small helper and utility functions so you don't have to repeat yourself
                -- many times.
                --
                -- In this case, we create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end
                    vim.keymap.set({ 'n', 'v' }, keys, func, { buffer = bufnr, desc = desc })
                end
                require("lsp-inlayhints").setup()
                require("lsp-inlayhints").on_attach(client, bufnr, false)

                local navic = require('nvim-navic')
                navic.setup({})
                navic.attach(client, bufnr)

                local ts = require('telescope.builtin')

                nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                nmap('<leader>lc', vim.lsp.buf.code_action, 'Lsp code action')
                nmap('gd',
                    function()
                        vim.lsp.buf.definition()
                        vim.api.nvim_input('zz')
                    end, '[G]oto [D]efinition')
                nmap('gr', ts.lsp_references, '[G]oto [R]eferences')
                nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                nmap('<leader>ld', ts.lsp_document_symbols, '[D]ocument [S]ymbols')
                nmap('<leader>li', ts.lsp_implementations, '[G]oto [I]mplementation')
                nmap('<leader>lk', function()
                    vim.diagnostic.open_float({
                        source = true,
                    })
                end, '[G]oto [I]mplementation')
                nmap('gi', ts.lsp_implementations, '[G]oto [I]mplementation')
                nmap('<leader>ls', ts.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                nmap('<leader>ls',
                    function()
                        local sorters = require "telescope.sorters"
                        ts.lsp_dynamic_workspace_symbols({
                            sorter = sorters.get_generic_fuzzy_sorter()
                        })
                    end,
                    'lsp')
                nmap('<leader>lf',
                    function()
                        ts.lsp_dynamic_workspace_symbols({
                            symbols = {
                                'function',
                                'method',
                            }
                        })
                    end,
                    'LSP Fuctions')
                nmap('<leader>lt',
                    function()
                        ts.lsp_dynamic_workspace_symbols({
                            symbols = {
                                'struct',
                                'typeparameter',
                                'interace',
                                'enum',
                                'struct',
                                'class',
                            }
                        })
                    end,
                    'LSP Types')
                nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
                nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
                -- Lesser used LSP functionality
                nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                nmap('<leader>ff', vim.lsp.buf.format, '[F]ormat')

                -- Create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                    vim.lsp.buf.format()
                end, { desc = 'Format current buffer with LSP' })
            end
            -- Enable the following language servers
            --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
            --
            --  Add any additional override configuration in the following tables. They will be passed to
            --  the `settings` field of the server config. You must look up that documentation yourself.
            local servers = {
                -- clangd = {},
                -- gopls = {},
                -- pyright = {},
                -- rust_analyzer = {},
                -- tsserver = {},
                rust_analyzer = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = false,
                        },
                        checkOnSave = {
                            command = "clippy",
                        },
                        workspace = {
                            symbol = {
                                search = {
                                    kind = "all_symbols"
                                }
                            }
                        },
                        procMacro = {
                            enable = true
                        }
                    }
                },
                sumneko_lua = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            }
            -- Setup neovim lua configuration
            require('neodev').setup()
            --
            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            capabilities.textDocument.completion.completionItem.resolveSupport = {
                properties = {
                    "additionalTextEdits",
                },
            }
            -- Setup mason so it can manage external tooling
            require('mason').setup()
            -- Ensure the servers above are installed
            local mason_lspconfig = require 'mason-lspconfig'
            mason_lspconfig.setup {
                ensure_installed = vim.tbl_keys(servers),
            }

            mason_lspconfig.setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                    }
                end,
            }

            require('fidget').setup()
        end
    },
    {
        'onsails/lspkind.nvim',
        config = function()
            require('lspkind').init()
        end
    },

    {
        'L3MON4D3/LuaSnip',
        version = "v1.*",
        -- install jsregexp (optional!).
        -- build = "make install_jsregexp"
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'onsails/lspkind.nvim',
            'hrsh7th/cmp-nvim-lsp-signature-help' },
        config = function()
            -- nvim-cmp setup
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            -- luasnip.setup({
            --     history = true
            -- })
            -- luasnip.config.setup {}

            local function maybe_load_vscode_snippets()
                local Path = require("luasnip.util.path")
                local cur_dir = vim.fn.getcwd()
                local vscode_dir = Path.join(cur_dir, ".vscode")
                local package_json_file = Path.join(vscode_dir, "package.json")
                if Path.exists(package_json_file)
                then
                    require("luasnip.loaders.from_vscode").lazy_load({
                        paths = vscode_dir
                    })
                end
            end

            --maybe_load_vscode_snippets()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/maik/projects/ark-modules/.vscode" } })
            cmp.setup {
                -- formatting = {
                --     fields = { "kind", "abbr", "menu" },
                --     format = function(entry, vim_item)
                --         local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry,
                --             vim_item)
                --         local strings = vim.split(kind.kind, "%s", { trimempty = true })
                --         kind.kind = " " .. strings[1] .. " "
                --         kind.menu = "    (" .. strings[2] .. ")"
                --
                --         return kind
                --     end,
                -- },
                window = {
                    completion = {
                        border = 'shadow',
                        winhighlight = "Normal:Normal,FloatBorder:Visual,Search:None,CursorLine:Visual",
                        col_offset = -3,
                        side_padding = 0,
                        scrollbar = false
                    },
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete({}),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp',               priority = 9 },
                    { name = 'luasnip',                priority = 1 },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'path' }
                },
            }
            vim.keymap.set({ 'i', 's' }, '<C-k>',
                function()
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end,
                { desc = 'Snippet next' })

            vim.keymap.set({ 'i', 's' }, '<C-j>',
                function()
                    luasnip.jump(-1)
                end,
                { desc = 'Snippet prev' })
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            },
            { 'nvim-telescope/telescope-fzy-native.nvim' },
            { 'olimorris/persisted.nvim' },
            { 'benfowler/telescope-luasnip.nvim' },
            { 'L3MON4D3/LuaSnip' }


        },
        config = function()
            local fzf_opts = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            }
            require("telescope").setup {
                pickers = {
                    find_files = {
                        find_command = {
                            'rg', '--ignore', '-L', '--hidden', '--files'
                        }
                    }
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    },
                    fzf = fzf_opts,
                },
            }

            require("telescope").load_extension("ui-select")
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('persisted')
            require('telescope').load_extension('luasnip')

            local ts = require('telescope.builtin')
            vim.keymap.set('n', '<leader>sf', ts.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sr', ts.resume, { desc = 'Search Resume' })
            vim.keymap.set('n', '<leader>sh', ts.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sw', ts.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', ts.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>le', ts.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>vt', ts.colorscheme, { desc = 'Theme' })
            vim.keymap.set('n', '<leader>vk', ts.keymaps, { desc = 'keymap' })
            vim.keymap.set('n', '<leader>ss', ts.current_buffer_fuzzy_find, { desc = 'Search in File' })
            vim.keymap.set('n', '<leader>vh', ts.help_tags, { desc = 'Help tags' })
            vim.keymap.set('n', '<leader>vup', require('lazy').show, { desc = 'Lazy' })
            vim.keymap.set('n', '<leader>pp', ':Telescope persisted<CR>', { desc = 'Find session' })
            vim.keymap.set('n', '<leader>vul', ':Mason<CR>', { desc = 'Mason LSP' })
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic' },
        config = function()
            local navic = require("nvim-navic")
            require('lualine').setup({
                sections = {
                    lualine_c = {
                        { navic.get_location, cond = navic.is_available },
                    }
                }
            })
        end
    },
    {
        'kdheepak/tabline.nvim',
        config = function()
            require 'tabline'.setup {
                options = {
                    show_tabs_only = true,
                    show_tabs_always = true
                }
            }
            vim.cmd [[
                set guioptions-=e " Use showtabline in gui vim
            ]]
        end,
        dependencies = { 'nvim-lualine/lualine.nvim', 'nvim-tree/nvim-web-devicons' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost" },
        dependencies = { 'p00f/nvim-ts-rainbow' },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all"
                ensure_installed = { "c", "lua", "rust", "toml", "help" },
                sync_install = false,
                highlight = {
                    enable = true,
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                }
            }
        end
    },
    {
        "olimorris/persisted.nvim",
        event = { 'VeryLazy' },
        config = function()
            require("persisted").setup({
                --autoload = true,
                allowed_dirs = {
                    '~/projects',
                    '~/.config/nvim'
                },
            })
            vim.keymap.set('n', '<leader>ps', ':SessionLoad<CR>:SessionStart<CR>', { desc = 'Load Session' })
            vim.keymap.set('n', '<leader>pc', ':SessionStart<CR>', { desc = 'Create Session' })
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
            local npairs = require('nvim-autopairs')
            local Rule = require('nvim-autopairs.rule')
            npairs.add_rule(Rule("<", ">"))
        end
    },
    ({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end
    }),
    {
        'TimUntersberger/neogit',
        dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
        config = function()
            local neogit = require('neogit')
            neogit.setup {
                integrations = {
                    diffview = true
                },
                disable_commit_confirmation = true,
            }


            vim.keymap.set('n', '<leader>gs', neogit.open, { desc = 'Git status' })
        end
    },
    { 'sindrets/diffview.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
        'ibhagwan/fzf-lua',
        -- optional for icon support
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    --{ 'chaoren/vim-wordmotion' },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require('nvim-tree').setup({

            })
            vim.keymap.set("n", "<leader>ft", ':NvimTreeFindFileToggle<CR>', { desc = 'File Explorer' })
        end
    },
    {
        "ggandor/leap.nvim",
        config = function()
            local leap = require("leap")
            leap.setup({
            })
            vim.keymap.set('n', 'r', '<Plug>(leap-forward-to)', { desc = 'Leap forward' })
            vim.keymap.set('n', 'R', '<Plug>(leap-backward-to)', { desc = 'Leap backward' })
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {}
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'numToStr/FTerm.nvim',
        config = function()
            require 'FTerm'.setup({
                border     = 'double',
                dimensions = {
                    height = 0.9,
                    width = 0.9,
                },
                cmd        = 'zsh'
            })
            vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
            vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
            local fterm = require("FTerm")


            local lazygit = fterm:new({
                ft = 'fterm_lazygit',
                cmd = 'lazygit',
            })

            vim.keymap.set('n', '<leader>gt', function() lazygit:toggle() end, { desc = 'Lazygit' })

            local gitui = fterm:new({
                ft = 'fterm_gitui',
                cmd = 'gitui',
            })

            vim.keymap.set('n', '<leader>gf', function() gitui:toggle() end, { desc = 'Gitui' })
        end
    },
    {
        'glacambre/firenvim',
        build = function() vim.fn['firenvim#install'](0) end
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<leader>gg', ':Git<CR>', { desc = 'Fugitive' })
        end
    },
    {
        'tpope/vim-rhubarb'
    },
    {
        'kburdett/vim-nuuid'
    },
    -- {
    --     'simrat39/rust-tools.nvim',
    --     config = function()
    --         local rt = require("rust-tools")
    --
    --         rt.setup({
    --             server = {
    --                 on_attach = function(_, bufnr)
    --                 end,
    --             },
    --         })
    --     end
    -- }
    -- {
    --     'rmagatti/auto-session',
    --     config = function()
    --         require("auto-session").setup {
    --         }
    --     end
    -- }
}, {
    install = {
        colorscheme = { mycolorscheme }
    }
})

vim.cmd.colorscheme(mycolorscheme)

if vim.fn.exists("g:neovide") then
    vim.g.neovide_cursor_animation_length = 0.0
    vim.g.neovide_confirm_quit = false
    vim.g.neovide_refresh_rate = 120
end
