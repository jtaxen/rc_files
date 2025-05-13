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
        dependencies = { "saghen/blink.cmp" },
    },
    -- colorschemes
    {'savq/melange-nvim', name='melange'},
    -- autocompletion
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },
            completion = {
                keyword = { range = "prefix" },
                documentation = {
                    auto_show = true,
                },
                accept = { 
                    auto_brackets = { enabled = false },
                },
            },
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },
})
