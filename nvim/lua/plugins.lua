local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP manager
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/luasnip',
        },
    },
    -- colorschemes
    {'savq/melange-nvim', name='melange'},
    -- indentation indicator
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        main = "ibl",
        opts = {},
    },
})
