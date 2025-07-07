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
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            { "ms-jpq/coq_nvim", branch = "coq" },
        },
        init = function()
            vim.g.coq_settings = {
                auto_start = "shut-up",
            }
        end,
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
    -- outline window
    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
    },
})
