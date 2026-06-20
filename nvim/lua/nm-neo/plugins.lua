-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',

        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use({ 'folke/tokyonight.nvim' })
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'patstockwell/vim-monokai-tasty' }
    use {
      "sindrets/diffview.nvim",
      requires = "nvim-lua/plenary.nvim"
    }

    use {
      "mikesmithgh/kitty-scrollback.nvim",
      config = function()
        require("kitty-scrollback").setup()
      end,
    }

    use {
        "mbbill/undotree"
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end
    }   

    use {
      "goolord/alpha-nvim",
      requires = { "nvim-tree/nvim-web-devicons" }, -- icons (you already have this)
      config = function()
        require("alpha").setup(
          require("alpha.themes.dashboard").config
        )
      end,
    }


    use { 'gennaro-tedesco/nvim-peekup' }

    use {
        "chrisgrieser/nvim-recorder",
        requires = { "rcarriga/nvim-notify" }, -- optional
        config = function()
            require("recorder").setup({})
        end,
    }

    use {
	"echasnovski/mini.nvim" ,
        config = function()
            require("mini.icons").setup({})
        end,
    }


    use {
        'rbong/vim-flog',
        cmd = { 'Flog', 'Flogsplit', 'Floggit' },
        requires = { 'tpope/vim-fugitive' },
    }


    -- UltiSnips plugin
    use {
        'SirVer/ultisnips',
        requires = { 'honza/vim-snippets' }, -- optional but handy
        config = function()
            -- Any optional configuration can go here
            vim.g.UltiSnipsExpandTrigger = '<Tab>'
            vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
            vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
            vim.g.UltiSnipsSnippetDirectories = {
                "/home/nmohan/.local/share/nvim/site/pack/packer/start/vim-snippets/UltiSnips/" }
        end
    }



    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }

    use { 'DaikyXendo/nvim-material-icon' }

    -- LSP server manager + bridge
    use { "williamboman/mason.nvim", run = ":MasonUpdate" }
    use { "williamboman/mason-lspconfig.nvim" }

    -- Completion
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-nvim-lua" }        

    use {
      "stevearc/aerial.nvim",
      config = function()
        require("aerial").setup()
      end
    }

    -- Snippets
    use { "L3MON4D3/LuaSnip" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "rafamadriz/friendly-snippets" }

        use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
        use { "tiagovla/scope.nvim" }

        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }

    use { 'm4xshen/autoclose.nvim',
        config = function()
            require("autoclose").setup()
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        's1n7ax/nvim-window-picker',
        tag = 'v2.*',
        config = function()
            require('window-picker').setup()
        end,
    }

    use {
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('trouble').setup {}
        end,
    }


    use { "stevearc/dressing.nvim" }
    use({
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({
                disable_legacy_commands = true
            })
        end,
    })

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use({ 'nvim-lua/plenary.nvim' })
    use({ 'ThePrimeagen/harpoon' })

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
end)
