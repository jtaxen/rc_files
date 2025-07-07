-- Remove trailing whitespaces before saving
vim.api.nvim_create_autocmd({"BufWritePre"},{
    pattern = { "*" },
    callback = function(args)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

