vim.opt.autocomplete = true
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {'i', 's'}),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    })
})

local opts = { noremap = true, silent = true }


vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function default_root(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local root

    if fname == "" then
        root = vim.uv.cwd()
    else
        local markers = {
            "compile_commands.json",
            ".clangd",
            ".clang-tidy",
            ".clang-format",
            "compile_flags.txt",
            "configure.ac",
            ".git",
        }
        root = vim.fs.root(fname, markers) or vim.fs.dirname(fname) or vim.uv.cwd()
    end

    vim.g.clangd_last_root = root
    on_dir(root)
end

local function clangd_on_init(client, init_result)
    if init_result.offsetEncoding then
        client.offset_encoding = init_result.offsetEncoding
    end
end

local lsps = {
    { 'clangd',
        {
            cmd = {
                'clangd',
                '--background-index',
                '--query-driver=/home/jacob/.espressif/tools/**,/opt/esp/**,/usr/bin/**/gcc,/usr/bin/**/g++',
            },
            filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
            root_dir = default_root,
            capabilities = {
                textDocument = {
                    completion = {
                        editsNearCursor = true,
                    },
                },
                offsetEncoding = { 'utf-8', 'utf-16' },
            },
            on_init = clangd_on_init,
        }
    },
    { 'pylsp' },
    { 'lua_ls',
        {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        }
    },
    { 'ts_ls',
        {
            filetypes = {
                'javascript',
                'javascriptreact',
                'typescript',
                'typescriptreact',
                'html',
            },
        },
    },
    { 'html',
        {
            filetypes = {
                'html',
                'htmldjango',
            },
        },
    },
}

for _, lsp in pairs(lsps) do
    local name, config = lsp[1], lsp[2]

    if config == nil then
        config = {}
    end

    config['capabilities'] = vim.tbl_deep_extend('force', capabilities, config['capabilities'] or {})
    config['on_attach'] = on_attach

    vim.lsp.config(name, config)
    vim.lsp.enable(name)
end
