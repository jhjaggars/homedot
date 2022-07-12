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
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    servers = {
        tsserver = {}
    }
})

require('harpoon').setup({
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
    tmux_autoclose_windows = false,
    excluded_filetypes = { 'harpoon' },
    mark_branch = false,
})

local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<leader>hp', require('harpoon.mark').add_file, opts)
vim.keymap.set('n', '<leader>fp', require('harpoon.ui').toggle_quick_menu, opts)

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, opts)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, opts)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, opts)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, opts)

vim.cmd([[
colorscheme falcon
set termguicolors

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])


