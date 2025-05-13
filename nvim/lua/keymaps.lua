-- define common options
local opts = {
    noremap = true,
    silent = true,          -- do not show message
}

keys = {
    -- Navigation
    ['n'] = 'j',
    ['e'] = 'k',
    ['i'] = 'l',
    ['k'] = 'n',
    ['K'] = 'N',
    ['p'] = 'e',
    ['P'] = 'E',
    ['='] = '$',
    ['+'] = '0',
    ['<C-p>'] = '<C-u>',
    -- Mode shifting
    ['l'] = 'i',
    -- Yanking/pasting
    ['j'] = 'p',
    ['J'] = 'P',
    -- Editing
    ['N'] = 'J',
    ['E'] = 'i<Enter>',
    ['€'] = '=',
}

for old_key, new_key in pairs(keys) do
    vim.keymap.set('', old_key, new_key, opts)
end
