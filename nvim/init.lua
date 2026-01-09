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
vim.o.autoread = true



vim.diagnostic.config({
    virtual_text = {
        prefix = '●',
        format = function(_)
            return ""
        end,
    },
    signs = true,
    underline = true,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- Get the current highlights for the "Sign" groups (which usually just have foreground colors)
        -- and link the VirtualText groups to them.
        -- "DiagnosticSignError" usually has the correct Red FG and no BG.
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "DiagnosticSignError" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "DiagnosticSignWarn" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "DiagnosticSignInfo" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "DiagnosticSignHint" })
    end,
})

vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
    group = vim.api.nvim_create_augroup('fuck_shada_temp', { clear = true }),
    pattern = { '*' },
    callback = function()
        local status = 0
        for _, f in ipairs(vim.fn.globpath(vim.fn.stdpath('data') .. '/shada', '*tmp*', false, true)) do
            if vim.tbl_isempty(vim.fn.readfile(f)) then
                status = status + vim.fn.delete(f)
            end
        end
        if status ~= 0 then
            vim.notify('Could not delete empty temporary ShaDa files.', vim.log.levels.ERROR)
            vim.fn.getchar()
        end
    end,
    desc = "Delete empty temp ShaDa files"
})

g.mapleader = " "
g.auto_save = 0
g.backspace = "eol,start,indent"
g.whichwrap = "<,>,h,l"

local mycolorscheme = 'onedark'

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
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            styles = {
                functions = { italic = false },
                keywords = { italic = false },
                variables = { italic = false },
                comments = { italic = false },
            },
            on_highlights = function(hl, c)
                -- This unsets the foreground color for unused items, allowing
                -- the underlying syntax color (red, blue, etc.) to show through.
                hl.DiagnosticUnnecessary = {
                    fg = nil, -- Remove the gray text color
                    undercurl = true,
                    underline = false,
                    sp = c.warning,
                }
            end,
        },
    },
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

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            'nvim-telescope/telescope.nvim',
            -- 'SmiteshP/nvim-navic',
            -- 'lvimuser/lsp-inlayhints.nvim'
        },
        config = function()
            vim.keymap.del('n', 'gri')
            vim.keymap.del('n', 'grn')
            vim.keymap.del('n', 'grr')
            vim.keymap.del('n', 'gra')
            vim.keymap.del('x', 'gra')
            -- LSP settings.
            --  This function gets run when an LSP connects to a particular buffer.
            -- local on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    local bufnr = ev.buf
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)

                    -- client.server_capabilities.semanticTokensProvider = nil

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
                    -- require("lsp-inlayhints").setup()
                    -- require("lsp-inlayhints").on_attach(client, bufnr, false)

                    -- local navic = require('nvim-navic')
                    -- navic.setup({})
                    -- navic.attach(client, bufnr)

                    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                    nmap('<leader>lc', vim.lsp.buf.code_action, 'Lsp code action')
                    nmap('gd',
                        function()
                            vim.lsp.buf.definition()
                            vim.api.nvim_input('zz')
                        end, '[G]oto [D]efinition')
                    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                    nmap('<leader>lk', function()
                        vim.diagnostic.open_float({
                            source = true,
                            border = "rounded",
                        })
                    end, 'Show Diagnostics')
                    -- nmap('<leader>ls', fzf.lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')
                    -- nmap('<leader>lf',
                    --     function()
                    --         fzf.lsp_workspace_symbols({
                    --             prompt      = 'LSP Functions> ',
                    --             -- Optional: Hint to the user to type the kind
                    --             fzf_opts    = {
                    --                 -- limiting the search to lines containing "Function" or "Method"
                    --                 -- isn't natively supported as a pre-filter, but you can seed the query:
                    --                 ['--query'] = "'Function | 'Method ",
                    --                 ['--history'] = vim.fn.stdpath("data") .. "/fzf-lua-lsp-history"
                    --             }
                    --         })
                    --     end,
                    --     'LSP Fuctions')
                    -- nmap('<leader>ls',
                    --     function()
                    --         local sorters = require "telescope.sorters"
                    --         ts.lsp_dynamic_workspace_symbols({
                    --             sorter = sorters.get_generic_fuzzy_sorter()
                    --         })
                    --     end,
                    --     'lsp')
                    local ts = require('telescope.builtin')
                    nmap('<leader>lf',
                        function()
                            ts.lsp_dynamic_workspace_symbols({
                            })
                        end,
                        'LSP Fuctions')
                    -- nmap('<leader>lf',
                    --     function()
                    --         ts.lsp_dynamic_workspace_symbols({
                    --             symbols = {
                    --                 'function',
                    --                 'method',
                    --             }
                    --         })
                    --     end,
                    --     'LSP Fuctions')
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
            })

            vim.lsp.config('rust_analyzer', {
                settings = {
                    ['rust-analyzer'] = {
                        completion = {
                            callable = {
                                snippets = "none"
                            },
                            postfix = {
                                enable = false
                            },
                        },
                        check = {
                            workspace = false,
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

                    },
                },
            })
            --
            -- -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            -- local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            -- capabilities.textDocument.completion.completionItem.resolveSupport = {
            --     properties = {
            --         "additionalTextEdits",
            --     },
            -- }
            -- Setup mason so it can manage external tooling
            require('mason').setup()
            -- Ensure the servers above are installed
            local mason_lspconfig = require 'mason-lspconfig'
            mason_lspconfig.setup {}


            require('fidget').setup()
        end
    },
    {
        "mason-org/mason.nvim",
        opts = {

        }
    },
    {
        'onsails/lspkind.nvim',
        config = function()
            require('lspkind').init()
        end
    },

    -- {
    --     'L3MON4D3/LuaSnip',
    --     version = "v1.*",
    -- },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            -- { 'nvim-telescope/telescope-ui-select.nvim' },
            -- {
            --     'nvim-telescope/telescope-fzf-native.nvim',
            --     build =
            --     'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            -- },
            -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' },
            { 'nvim-telescope/telescope-fzy-native.nvim' },
            { 'olimorris/persisted.nvim' },
            -- { 'benfowler/telescope-luasnip.nvim' },
            -- { 'L3MON4D3/LuaSnip' }


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
                -- extensions = {
                --     -- ["ui-select"] = {
                --     --     require("telescope.themes").get_dropdown {
                --     --     }
                --     -- },
                --     fzf = fzf_opts,
                -- },
            }
            --
            -- -- require("telescope").load_extension("ui-select")
            -- require('telescope').load_extension('fzf')
            require('telescope').load_extension('fzy_native')
            -- require('telescope').load_extension('persisted')
            -- require('telescope').load_extension('luasnip')
            --
            -- local ts = require('telescope.builtin')
            -- vim.keymap.set('n', '<leader>sf', ts.files, { desc = '[S]earch [F]iles' })
            -- vim.keymap.set('n', '<leader>sr', ts.resume, { desc = 'Search Resume' })
            -- vim.keymap.set('n', '<leader>sh', ts.help_tags, { desc = '[S]earch [H]elp' })
            -- vim.keymap.set('n', '<leader>sw', ts.grep, { desc = '[S]earch current [W]ord' })
            -- vim.keymap.set('n', '<leader>sg', ts.live_grep, { desc = '[S]earch by [G]rep' })
            -- vim.keymap.set('n', '<leader>le', ts.lsp_workspace_diagnostics, { desc = '[S]earch [D]iagnostics' })
            -- vim.keymap.set('n', '<leader>vt', ts.colorschemes, { desc = 'Theme' })
            -- vim.keymap.set('n', '<leader>vk', ts.keymaps, { desc = 'keymap' })
            -- vim.keymap.set('n', '<leader>ss', ts.grep_curbuf, { desc = 'Search in File' })
            -- vim.keymap.set('n', '<leader>vh', ts.help_tags, { desc = 'Help tags' })
            -- vim.keymap.set('n', '<leader>vup', require('lazy').show, { desc = 'Lazy' })
            -- -- vim.keymap.set('n', '<leader>pp', ':Telescope persisted<CR>', { desc = 'Find session' })
            -- vim.keymap.set('n', '<leader>vul', ':Mason<CR>', { desc = 'Mason LSP' })
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
            })
        end
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        event = 'VimEnter',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            vim.o.termguicolors = true
            local bufferline = require('bufferline')
            bufferline.setup({
                options = {
                    mode = "tabs",
                    style_preset = bufferline.style_preset.minimal,
                    indicator = {
                        style = 'underline'
                    },
                    tab_size = 22,
                    show_close_icon = false,
                    show_tab_indicators = false,
                    show_buffer_close_icons = false,
                    numbers = "ordinal",
                    separator_style = "thick",
                }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        -- dependencies = { 'p00f/nvim-ts-rainbow' },
        -- dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
        config = function()
            require 'nvim-treesitter'.install { 'rust', 'c', 'toml', 'help', 'lua' }
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { '<filetype>' },
                callback = function() vim.treesitter.start() end,
            })
        end
    },
    -- {
    --     "olimorris/persisted.nvim",
    --     event = { 'VeryLazy' },
    --     config = function()
    --         require("persisted").setup({
    --             --autoload = true,
    --             allowed_dirs = {
    --                 '~/projects',
    --                 '~/.config/nvim'
    --             },
    --         })
    --         vim.keymap.set('n', '<leader>ps', ':SessionLoad<CR>:SessionStart<CR>', { desc = 'Load Session' })
    --         vim.keymap.set('n', '<leader>pc', ':SessionStart<CR>', { desc = 'Create Session' })
    --     end,
    -- },
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
    -- {
    --     'lukas-reineke/indent-blankline.nvim',
    --     config = function()
    --         require("ibl").setup {
    --             scope = {
    --                 show_start = false,
    --                 show_end = false
    --             }
    --         }
    --     end
    -- },
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
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "nvim-mini/mini.icons" },
        ---@module "fzf-lua"
        ---@type fzf-lua.Config|{}
        ---@diagnostics disable: missing-fields
        opts = {
        },
        config = function()
            local fzf = require('fzf-lua')
            fzf.register_ui_select()
            vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = 'Search Resume' })
            vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sw', fzf.grep, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
            -- vim.keymap.set('n', '<leader>le', fzf.lsp_workspace_diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>le',
                function()
                    fzf.lsp_workspace_diagnostics({ sort = 1 })
                end,
                { desc = 'Workspace diagnostics' })

            vim.keymap.set('n', '<leader>lE',
                function()
                    fzf.lsp_document_diagnostics({ sort = 1 })
                end,
                { desc = 'Document Diagnostics' })

            vim.keymap.set('n', '<leader>vt', fzf.colorschemes, { desc = 'Theme' })
            vim.keymap.set('n', '<leader>vk', fzf.keymaps, { desc = 'keymap' })
            vim.keymap.set('n', '<leader>ss', fzf.grep_curbuf, { desc = 'Search in File' })
            vim.keymap.set('n', '<leader>vh', fzf.help_tags, { desc = 'Help tags' })
            vim.keymap.set('n', '<leader>vup', require('lazy').show, { desc = 'Lazy' })
            -- vim.keymap.set('n', '<leader>pp', ':Telescope persisted<CR>', { desc = 'Find session' })
            vim.keymap.set('n', '<leader>vul', ':Mason<CR>', { desc = 'Mason LSP' })
            vim.keymap.set('n', '<leader>vul', ':Mason<CR>', { desc = 'Mason LSP' })
            vim.keymap.set('n', '<leader>ls', fzf.lsp_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
            vim.keymap.set('n', '<leader>ld', fzf.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
            vim.keymap.set('n', '<leader>li', fzf.lsp_implementations, { desc = '[G]oto [I]mplementation' })
            vim.keymap.set('n', 'gi', fzf.lsp_implementations, { desc = '[G]oto [I]mplementation' })
            vim.keymap.set('n', 'gr', fzf.lsp_references, { desc = '[G]oto [R]eferences' })
            vim.keymap.set('n', '<leader>lr', fzf.lsp_references, { desc = '[G]oto [R]eferences' })
            -- require("fzf-lua").setup {
            --     fzf_opts = {
            --         ["--delimiter"] = "\\",
            --         ["--with-nth"] = "-3.."
            --     }
            -- }
        end
        ---@diagnostics enable: missing-fields
    },
    {
        "folke/persistence.nvim",
        -- event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        },
        config = function(_, opts)
            require("persistence").setup(opts)
            -- load the session for the current directory
            vim.keymap.set("n", "<leader>pc", function() require("persistence").load() end)

            -- select a session to load
            vim.keymap.set("n", "<leader>ps", function() require("persistence").select() end)

            -- load the last session
            vim.keymap.set("n", "<leader>pl", function() require("persistence").load({ last = true }) end)

            -- -- stop Persistence => session won't be saved on exit
            -- vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)
        end
    },
    -- {
    --     "nvim-treesitter/nvim-treesitter-context",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter"
    --     },
    --     config = function()
    --         require 'treesitter-context'.setup {
    --             enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
    --             multiwindow = false,      -- Enable multiwindow support.
    --             max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    --             min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    --             line_numbers = true,
    --             multiline_threshold = 20, -- Maximum number of lines to show for a single context
    --             trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    --             mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
    --             -- Separator between context and content. Should be a single character string, like '-'.
    --             -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    --             separator = nil,
    --             zindex = 20,     -- The Z-index of the context window
    --             on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    --         }
    --     end
    -- },
    {
        "bassamsdata/namu.nvim",
        opts = {
            global = {},
            namu_symbols = { -- Specific Module options
                options = {},
            },
        },
        -- === Suggested Keymaps: ===
        vim.keymap.set("n", "<leader>ln", ":Namu symbols<cr>", {
            desc = "Jump to LSP symbol",
            silent = true,
        }),
        vim.keymap.set("n", "<leader>lw", ":Namu workspace<cr>", {
            desc = "LSP Symbols - Workspace",
            silent = true,
        })
    },
    {
        'saghen/blink.cmp',
        version = '1.*',
        opts = {
            keymap = {
                preset = 'super-tab',
                ['<enter>'] = { 'accept', 'fallback' },
            },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },
            signature = { enabled = true },
            completion = {
                accept = { auto_brackets = { enabled = true } },
                -- accept = {
                --     auto_brackets = {
                --         enabled = false,
                --         kind_resolution = {
                --             enabled = false,
                --         },
                --         semantic_token_resolution = {
                --             enabled = false,
                --         },
                --     },
                -- },
                -- normalize_line_endings = true,
                menu = {
                    auto_show = true
                }
            },

            sources = {
                default = { 'lsp', 'path', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {
        "esmuellert/vscode-diff.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        cmd = "CodeDiff",
    },
    {
        "olimorris/codecompanion.nvim",
        version = "^18.0.0",
        opts = {
            interactions = {
                chat = {
                    adapter = {
                        name = "gemini",
                        model = "gemini-3-pro-preview",
                    },
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "stevearc/profile.nvim",
        config = function()
            -- local should_profile = os.getenv("NVIM_PROFILE")
            local should_profile = "1"
            if should_profile then
                require("profile").instrument_autocmds()
                if should_profile:lower():match("^start") then
                    require("profile").start("*")
                else
                    require("profile").instrument("*")
                end
            end

            local function toggle_profile()
                local prof = require("profile")
                if prof.is_recording() then
                    prof.stop()
                    vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" },
                        function(filename)
                            if filename then
                                prof.export(filename)
                                vim.notify(string.format("Wrote %s", filename))
                            end
                        end)
                else
                    prof.start("*")
                end
            end
            vim.keymap.set("", "<f1>", toggle_profile)
        end

    },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('onedark').setup {
                style = 'warmer'
            }
            require('onedark').load()
        end
    }

    -- {
    --     "rachartier/tiny-inline-diagnostic.nvim",
    --     event = "VeryLazy",
    --     priority = 1000,
    --     config = function()
    --         require("tiny-inline-diagnostic").setup({
    --             preset = "simple",
    --             options = {
    --                 softwrap = 60,
    --                 show_diags_only_under_cursor = false,
    --             }
    --         })
    --         vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    --     end,
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
    vim.g.neovide_refresh_rate = 240
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_in_insert_mode = false
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_scroll_animation_far_lines = 0
    vim.g.neovide_scroll_animation_length = 0.00
    vim.keymap.set({ "n", "x", "c", "i" }, "<C-S-C>", '"+y', { desc = "Copy system clipboard" })
    -- vim.keymap.set({ "n", "x" }, "<C-S-V>", '<C-r>+', { desc = "Paste system clipboard" })
    vim.keymap.set({ "n", "x" }, "<C-S-V>", '"+p', { desc = "Paste from system clipboard" })
    vim.keymap.set({ "i", "c" }, "<C-S-V>", "<C-r>+", { desc = "Paste from system clipboard" })
    vim.keymap.set("t", "<C-S-V>", function()
        local content = vim.fn.getreg('+')
        vim.api.nvim_paste(content, true, -1)
    end, { desc = "Paste from system clipboard" })
    vim.o.guifont = "FiraMono Nerd Font:h13"
end
