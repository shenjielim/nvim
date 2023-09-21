require('dbee').setup({
    lazy = true,
    sources = {
        require("dbee.sources").MemorySource:new({
            {
                name = "message-queue",
                type = "mysql",
                url = "mysql://message-queue.cqltqtzpc2wk.ap-southeast-1.rds.amazonaws.com:3306/messageQueue"
            }
        })
    }
})
-- test
-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap("n", "<C-D>", [[ <Cmd>lua require('dbee').open()<CR>]], {noremap = true, silent = true, expr = false})
