vim.opt.clipboard = 'unnamedplus'	-- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'n'			-- disallow mouse

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI config
vim.opt.number = true			-- show absolute number
vim.opt.relativenumber = false
vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = true

-- Searching
vim.opt.incsearch = true        -- search as characters are entered
vim.opt.hlsearch = true         -- highlight matches
vim.opt.ignorecase = false      
vim.opt.smartcase = false       -- makes search case sensitive if ignorecase and an uppercase is entered
