-- vim: foldmethod=marker
local get_keys = R('funcs.packer').get_keys
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
execute 'packadd packer.nvim'

return require('packer').startup(function(use)
               use { -- nvim-autopairs {{{
                 "windwp/nvim-autopairs",
                config = 'require("nvim-autopairs").setup{}',
               } -- }}}
            use { -- architext {{{
                "vigoux/architext.nvim",
                module = 'architext',
                cmd = {'ArchitextREPL', 'Architext', 'A'},
            } -- }}}
            use { -- biscuits {{{
                'code-biscuits/nvim-biscuits',
                module = 'nvim-biscuits',
                setup = 'require("plugin_settings.biscuits").setup()',
                config = 'require("plugin_settings.biscuits").config()',
            } -- }}}
    use { -- bqf better quickfix {{{
        'kevinhwang91/nvim-bqf',
        event = 'QuickFixCmdPre',
        config = 'require("plugin_settings.bqf").config()',
    } -- }}}
    use { -- capword {{{
        'AckslD/vim-capword',
        keys = {'<A-k>', '<A-j>'},
    } -- }}}
    use { -- cheatsheet {{{
        'sudormrfbin/cheatsheet.nvim',
        cmd = 'Cheatsheet',
        setup = 'require("plugin_settings.cheatsheet").setup()',
    } -- }}}
    use { -- cmp {{{
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        requires = {
            {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
            {'hrsh7th/cmp-path', after = 'nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
            {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'},
            {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'},
            {
                'petertriho/cmp-git',
                after = 'nvim-cmp',
                config = 'require("plugin_settings.cmp_git").config()',
            },
            {'onsails/lspkind-nvim', module = 'lspkind'},
            {
                'L3MON4D3/LuaSnip',
                module = 'luasnip',
                config = 'require("plugin_settings.luasnip").config()',
            },

        },
        config = 'require("plugin_settings.cmp").config()',
    } -- }}}
    use { -- colorizer {{{
        'norcalli/nvim-colorizer.lua',
        setup = 'require("plugin_settings.colorizer").setup()',
        config = 'require("plugin_settings.colorizer").config()',
        cmd = 'ColorizerToggle',
    } -- }}}
    use { -- Comment.nvim {{{
        'numToStr/Comment.nvim',
        keys = {'gc', 'gb'},
        config = 'require("Comment").setup()'
    } -- }}}
    use { -- dap debugging {{{
        'mfussenegger/nvim-dap',
        requires = {
            {'nvim-telescope/telescope-dap.nvim', after = 'nvim-dap'},
            {'theHamsta/nvim-dap-virtual-text', after = 'nvim-dap'},
        },
        module = 'dap',
        setup = 'require("plugin_settings.dap").setup()',
        config = 'require("plugin_settings.dap").config()',
    } -- }}}
    use { -- dashboard {{{
        'glepnir/dashboard-nvim',
        -- event = "BufWinEnter",  TODO too slow
        cmd = 'Dashboard',
        setup = 'require("plugin_settings.dashboard").setup()',
    } -- }}}
    use { -- dial {{{
        'monaqa/dial.nvim',
        keys = {'<C-a>', '<C-x>'},
        config = 'require("plugin_settings.dial").config()',
    } -- }}}
    use { -- diffview {{{
        'sindrets/diffview.nvim',
        cmd = 'DiffviewOpen',
    } -- }}}
    -- use { -- email {{{
    --     'soywod/himalaya',
    --     rtp = "vim",
    --     cmd = 'Himalaya',
    --     setup = 'require("plugin_settings.himalaya").setup()',
    --     config = 'require("plugin_settings.himalaya").config()',
    -- } -- }}}
    use { -- estream {{{
        'JoshMcguigan/estream',
        opt = true,
        run = 'bash install.sh v0.2.0',
    } -- }}}
    use { -- FTerm (floating term) {{{
        'numtostr/FTerm.nvim',
        module = 'FTerm',
        setup = 'require("plugin_settings.fterm").setup()',
        config = 'require("plugin_settings.fterm").config()',
    } -- }}}
    use { -- fugitive git merge conflicts {{{
        'tpope/vim-fugitive',
        -- requires = {'tpope/vim-rhubarb'},
        cmd = {'Gdiffsplit', 'GBrowse', 'Gclog', 'Git'},
        setup = 'require("plugin_settings.fugitive").setup()',
    } -- }}}
    use { -- fzf-lua {{{
        'ibhagwan/fzf-lua',
        module = 'fzf-lua',
        wants = {'nvim-fzf', 'nvim-web-devicons'},
        requires = {
            {'vijaymarupudi/nvim-fzf', module = 'fzf'},
            {"kyazdani42/nvim-web-devicons", opt = true},
        },
        setup = 'require("plugin_settings.fzf_lua").setup()',
    } -- }}}
    use { -- git blame {{{
        'f-person/git-blame.nvim',
        cmd = 'GitBlameToggle',
        setup = 'require("plugin_settings.git_blame").setup()',
        config = 'require("plugin_settings.git_blame").config()',
    } -- }}}
    use { -- git linker {{{
        'ruifm/gitlinker.nvim',
        keys = '<leader>gy',
        wants = {'plenary.nvim'},
        requires = {'nvim-lua/plenary.nvim'},
        setup = 'require("plugin_settings.gitlinker").setup()',
        config = 'require("plugin_settings.gitlinker").config()',
    } -- }}}
    use { -- git signs {{{
        'lewis6991/gitsigns.nvim',
        wants = {'plenary.nvim'},
        requires = {'nvim-lua/plenary.nvim'},
        module = 'gitsigns',
        setup = 'require("plugin_settings.gitsigns").setup()',
        config = 'require("plugin_settings.gitsigns").config()',
    } -- }}}
    use { -- theme {{{
        'RRethy/nvim-base16',
        wants = 'lush.nvim',
        requires = {{"rktjmp/lush.nvim", module = 'lush'}},
        config = require('base16-colorscheme').setup({ base00 = '17191E',
            base01 = '22262d', base02 = '3c3f4c', base03 = '383a47',
            base04 = '555e70', base05 = '8b9cbe', base06 = 'B2BFD9',
            base07 = 'f4f4f7', base08 = 'ff29a8', base09 = '85ffe0',
            base0A = 'f0ffaa', base0B = '0badff', base0C = '8265ff',
            base0D = '00eaff', base0E = '00f6d9', base0F = 'ff3d81',}),
    } -- }}}
    use { -- harpoon {{{
        'ThePrimeagen/harpoon',
        wants = {'popup.nvim', 'plenary.nvim'},
        setup = 'require("plugin_settings.harpoon").setup()',
    } -- }}}
    use { -- hlslens {{{
        'kevinhwang91/nvim-hlslens',
        keys = '/',
        module = 'hlslens',
        setup = 'require("plugin_settings.hlslens").setup()',
    } -- }}}
    use { -- hop {{{
        'phaazon/hop.nvim',
        setup = 'require("plugin_settings.hop").setup()',
        config = 'require("plugin_settings.hop").config()',
        cmd = {
            'HopChar2',
            'HopChar1',
            'HopChar2',
            'HopWord',
            'HopLine',
            'HopPattern',
            'HopWord',
        },
    } -- }}}
    use { -- Latex {{{
        'lervag/vimtex',
        config = 'require("plugin_settings.vimtex").config()',
        ft = {'tex'},
    } -- }}}
    use { -- linediff {{{
        'AndrewRadev/linediff.vim',
        cmd = 'Linediff',
    } -- }}}
    use { -- lspconfig {{{
        'neovim/nvim-lspconfig',
        requires = {
            {'ray-x/lsp_signature.nvim', module = 'lsp_signature'},
            { -- {{{ null-ls
                'jose-elias-alvarez/null-ls.nvim',
                module = 'null-ls',
                config = 'require("plugin_settings.null_ls").config()',
            }, -- }}}
        },
        config = 'require("plugin_settings.lspconfig").config()',
    } -- }}}
    use { -- lsp-installer {{{

        'williamboman/nvim-lsp-installer',
    } -- }}}
    use { -- markdown {{{
        {
            'SidOfc/mkdx',
            setup = 'require("plugin_settings.mkdx").setup()',
            ft = {'markdown'},
        },
        {'mzlogin/vim-markdown-toc', ft = {'markdown'}}, -- table of contents
        {'iamcco/markdown-preview.nvim', run = vim.fn['mkdp#util#install'], ft = {'markdown'}}, -- preview
    } -- }}}
    use { -- matchup {{{
        'andymass/vim-matchup',
        keys = '%',
    } -- }}}
    use { -- mundo undo visualization {{{
        'simnalamburt/vim-mundo',
        cmd = 'MundoToggle',
        setup = 'require("plugin_settings.mundo").setup()',
    } -- }}}
    use { -- octo (github) {{{
        'pwntester/octo.nvim',
        cmd = 'Octo',
        setup = 'require("plugin_settings.octo").setup()',
        config = 'require("plugin_settings.octo").config()',
    } -- }}}
    use { -- neoclip {{{
        'AckslD/nvim-neoclip.lua',
        requires = {'tami5/sqlite.lua', module = 'sqlite'},
        config = 'require("plugin_settings.neoclip").config()',
    } -- }}}
    use { -- neoscroll smooth scrolling {{{
        'karb94/neoscroll.nvim',
        config = 'require("plugin_settings.neoscroll").config()',
        keys = {'<C-u>', '<C-d>',-- '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    } -- }}}
    use { -- packer {{{
        'wbthomason/packer.nvim',
        module = 'packer',
        config = 'require("plugin_settings.packer").config()',
    } -- }}}
    use { -- plenary {{{
        'nvim-lua/plenary.nvim',
        module = 'plenary',
        setup = 'require("plugin_settings.plenary").setup()',
    } -- }}}
    use { -- popup {{{
        'nvim-lua/popup.nvim',
        module = 'popup',
    } -- }}}
    use { -- project.nvim {{{
        'ahmedkhalf/project.nvim',
        config = 'require("plugin_settings.project").config()',
    } -- }}}
    use { -- python {{{
        'Vimjas/vim-python-pep8-indent', ft = {'python'}, -- pep8 indent TODO needed?
    } -- }}}
    use { -- pytrize {{{
        'AckslD/nvim-pytrize.lua',
        -- module = 'pytrize',
        cmd = {'Pytrize', 'PytrizeClear', 'PytrizeJump', 'PytrizeJumpFixture'},
        config = 'require("plugin_settings.pytrize").config()',
    } -- }}}
    use { -- refactoring {{{
        "ThePrimeagen/refactoring.nvim",
        module = 'refactoring',
        setup = 'require("plugin_settings.refactoring").setup()',
        config = 'require("plugin_settings.refactoring").config()',
    } -- }}}
    use { -- replacer editable quickfix {{{
        'gabrielpoca/replacer.nvim',
        module = 'replacer',
        setup = 'require("plugin_settings.replacer").setup()',
    } -- }}}
    use { -- revJ {{{
        'AckslD/nvim-revJ.lua',
        keys = {'<leader>j', '<leader>J'},
        wants = {'vim-textobj-parameter'},
        setup = 'require("plugin_settings.revj").setup()',
        config = 'require("plugin_settings.revj").config()',
    } -- }}}
    use { -- sandwich surround braces {{{
        'machakann/vim-sandwich',
        -- keys = {'sa', 'sd', 'sr', 'sdb', 'srb'}, -- TODO incompatible with goto last line autocmd
    } -- }}}
    use {
        "blackCauldron7/surround.nvim",
        config = function()
            require('surround').setup{mappings_style = "sandwicurroundh"}
        end
    }
    use { -- SISR {{{
            'AckslD/vim-sisr',
            cmd = {'Sisr', 'SisrTexEq'},
    } -- }}}
    use { -- snippets {{{
                'norcalli/snippets.nvim',
                opt = true,
                -- keys = {{'i', '<C-k>'}},
                config = 'require("plugin_settings.snippets").config()',
            } -- }}}
    use { -- SortFolds {{{
        'obreitwi/vim-sort-folds',
        keys = {{'v', '<leader>fs'}},
        setup = 'require("plugin_settings.sortfolds").setup()',
    } -- }}}
    use { -- spectre {{{
        'windwp/nvim-spectre',
        wants = {'popup.nvim', 'plenary.nvim'},
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
        module = 'spectre',
        setup = 'require("plugin_settings.spectre").setup()',
        config = 'require("plugin_settings.spectre").config()',
    } -- }}}
    use { 
        "kyazdani42/nvim-web-devicons"
    }
use { -- statusline {{{
    "NTBBloodbath/galaxyline.nvim",
    -- your statusline
    config = function()
        require("galaxyline.themes.eviline") -- ⛧
    end,
    -- some optional icons
    requires = { "kyazdani42/nvim-web-devicons", opt = false },
-- 'hoob3rt/lualine.nvim',
-- wants = {'nvim-gps'},
-- requires = {
--     {
--         'SmiteshP/nvim-gps',
--         opts = true,
--         config = 'require("plugin_settings.gps").config()',
--     },
-- },
-- config = 'require("plugin_settings.lualine").config()',
} -- }}}
    use { -- telescope {{{
        'nvim-telescope/telescope.nvim',
        wants = {'popup.nvim', 'plenary.nvim'},
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {
                'nvim-telescope/telescope-symbols.nvim',
                after = 'telescope.nvim',
            }
        },
        cmd = 'Telescope',
        module = 'telescope',
        setup = 'require("plugin_settings.telescope").setup()',
        config = 'require("plugin_settings.telescope").config()',
    } -- }}}
        use { -- {{{ telescope-repo
            'cljoly/telescope-repo.nvim',
            setup = 'require("plugin_settings.telescope_repo").setup()',
        } -- }}}
    use { -- terminal colors {{{
        'norcalli/nvim-terminal.lua',
        config = 'require("plugin_settings.terminal").config()',
        event = 'TermOpen',
    } -- }}}
            use { -- text objects {{{
                {'kana/vim-textobj-user', opt = true},
                {
                    'kana/vim-textobj-entire',
                    keys = get_keys({'o', 'v'}, {{'a', 'i'}, {'e'}}),
                    wants = 'vim-textobj-user',
                },
                {
                    'michaeljsmith/vim-indent-object',
                    keys = get_keys({'o', 'v'}, {{'a', 'i'}, {'i', 'I'}}),
                    wants = 'vim-textobj-user',
                },
                {
                    'kana/vim-textobj-syntax',
                    keys = get_keys({'o', 'v'}, {{'a', 'i'}, {'y'}}),
                    wants = 'vim-textobj-user',
                },
                {
                    'sgur/vim-textobj-parameter',
                    keys = get_keys({'o', 'v'}, {{'a', 'i'}, {','}}),
                    wants = 'vim-textobj-user',
                },
                {
                    'beloglazov/vim-textobj-quotes',
                    keys = get_keys({'o', 'v'}, {{'a', 'i'}, {'q'}}),
                    wants = 'vim-textobj-user',
                },
            } -- }}}
    use { -- todo.txt {{{
        'AckslD/todo.txt-vim',
        branch = 'develop',
        ft = 'todo',
        config = 'require("plugin_settings.todo").config()',
    } -- }}}
    use { -- alternatetoggle {{{
            'rmagatti/alternate-toggler'
    } -- }}}
    use { -- treesitter {{{
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        module = 'nvim-treesitter',
        event = "BufRead",
        requires = {
            { -- rainbow brackets {{{ TODO how to lazy load properly?
                'p00f/nvim-ts-rainbow',
                opt = true,
                cmd = 'TSRainbowToggle',
                -- after = 'nvim-treesitter',
                setup = 'require("plugin_settings.ts_rainbow").setup()',
                config = 'require("plugin_settings.ts_rainbow").config()',
            }, -- }}}
            { -- treesitter-textobjects {{{
                'AckslD/nvim-treesitter-textobjects',
                branch = 'linewise-function-class',
                module = 'nvim-treesitter-textobjects',
                keys = { -- TODO use get keys
                    {'o', 'af'},
                    {'o', 'ac'},
                    {'o', 'if'},
                    {'o', 'ic'},
                    '<Leader>Lf',
                    '<Leader>Lc',
                    '<Leader>L,',
                    '<Leader>Hf',
                    '<Leader>Hc',
                    '<Leader>H,',
                    '<Leader>lpf',
                    '<Leader>lpc',
                    "]m",
                    -- "]]",
                    "]M",
                    -- "][",
                    "[m",
                    -- "[[",
                    "[M",
                    "[]",
                    -- "df",
                    -- "dF",
                },
                setup = 'require("plugin_settings.ts_textobjects").setup()',
                config = 'require("plugin_settings.ts_textobjects").config()',
            }, -- }}}
            { -- treesitter playground {{{
                'nvim-treesitter/playground',
                cmd = 'TSPlaygroundToggle',
                setup = 'require("plugin_settings.ts_playground").setup()',
                config = 'require("plugin_settings.ts_playground").config()',
            }, -- }}}
            { -- treesitter refactor {{{
                'nvim-treesitter/nvim-treesitter-refactor',
                keys = {'grn', 'gnd', 'gnD', 'gO'},
                setup = 'require("plugin_settings.ts_refactor").setup()',
                config = 'require("plugin_settings.ts_refactor").config()',
            },
        }, -- }}}
        config = 'require("plugin_settings.treesitter").config()',
    } -- }}}
    use { -- trouble {{{
        'folke/trouble.nvim',
        wants = 'nvim-web-devicons',
        requires = {{"kyazdani42/nvim-web-devicons", opt = true}},
        cmd = {'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh'},
        setup = 'require("plugin_settings.trouble").setup()',
        config = 'require("plugin_settings.trouble").config()',
    } -- }}}
        use { -- venn (draw boxes) {{{
            'jbyuki/venn.nvim',
            cmd = 'VBox',
            setup = 'require("plugin_settings.venn").setup()',
        } -- }}}
        use { -- vifm {{{
            'vifm/vifm.vim',
            cmd = {'Vifm', 'DiffVifm', 'SplitVifm', 'VsplitVifm', 'TabVifm'},
            setup = 'require("plugin_settings.vifm").setup()',
        } -- }}}
        -- use { -- vim-unimpaired (brackets maps) TODO extract what's used? {{{
        --     'tpope/vim-unimpaired',
        -- } -- }}}
    use { -- vista {{{
        'liuchengxu/vista.vim',
        cmd = 'Vista',
        setup = 'require("plugin_settings.vista").setup()',
    } -- }}}
    use { -- which key {{{
        'folke/which-key.nvim',
        config = 'require("plugin_settings.which_key").config()',
    } -- }}}
    use { -- zen mode {{{
        'folke/zen-mode.nvim',
        requires = {
            { -- limelight {{{
                'folke/twilight.nvim',
                cmd = 'Twilight',
                config = 'require("plugin_settings.twilight").config()',
            }
        }, -- }}}
        cmd = 'ZenMode',
        setup = 'require("plugin_settings.zen_mode").setup()',
        config = 'require("plugin_settings.zen_mode").config()',
    } -- }}}
    use { -- zoxide {{{
        'nanotee/zoxide.vim',
        cmd = {'Z', 'Lz'},
        requires = {
            {'jvgrootveld/telescope-zoxide', opt = true, after = 'telescope.nvim'},
        },
        setup = 'require("plugin_settings.zoxide").setup()',
    } -- }}}
end)
