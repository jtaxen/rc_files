vim.o.background = 'light'
vim.opt.termguicolors = true

local colorscheme = 'melange'

local is_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
