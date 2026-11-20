require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunx')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

lspconfig.pylsp.setup({
    on_attach=on_attach,
    settings={
        pylsp = {
            plugins = {
                flake8 = { enabled = false },
                black = { enabled = false },
                autepep8 = { enabled = false },
                yapf = { enabled = false },
                pylint = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyple = { enabled = false },
                pylsp_mypy = { enabled = false },
                jedi_completion = { enabled = true },
                pyls_isort = { enabled = false },
            }
        }
    }
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = { enable = false }
        }
    }
})

lspconfig.groovyls.setup({
    on_attach = on_attach,
    cmd = {
        'java',
        '-jar',
        '/home/jatax/Source/groovy-language-server/build/libs/groovy-language-server-all.jar',
    },
    filetypes = {
        'groovy',
        'Jenkinsfile',
    },
})


lspconfig.gopls.setup({
    on_attach = on_attach,
})
