require('plugins')

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.g.mapleader = " "

require('nvim-lsp-setup').setup({
    default_mappings = true,
    on_attach = function(client, bufnr)
        require('nvim-lsp-setup.utils').format_on_save(client)
    end,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    servers = {
        tsserver = {}
    }
})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, opts)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, opts)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, opts)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, opts)

vim.cmd([[
colorscheme falcon
set termguicolors
]])


