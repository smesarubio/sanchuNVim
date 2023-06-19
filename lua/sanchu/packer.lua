-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'mbbill/undotree' } }
    }

    use "EdenEast/nightfox.nvim" -- Packer

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('nvim-tree/nvim-web-devicons')

    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }



    use { 'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'voldikss/vim-floaterm'

    -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'

    use 'onsails/lspkind.nvim'

    use { "ellisonleao/gruvbox.nvim" }

    use {
        'VonHeikemen/fine-cmdline.nvim',
        requires = {
            { 'MunifTanjim/nui.nvim' }
        }
    }


    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            use({
                'L3MON4D3/LuaSnip',
                requires = 'rafamadriz/friendly-snippets',
                config = function()
                    require('luasnip').config.set_config({
                        history = true,
                        updateevents = 'TextChanged,TextChangedI',
                    })
                    require('luasnip/loaders/from_vscode').load()
                end,
            })
        }
    }

    use {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup()
        end
    }

    use { "catppuccin/nvim", as = "catppuccin" }
    use 'saadparwaiz1/cmp_luasnip'
end)
