require('plugins')
require('jhjaggars')

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.o.termguicolors = true

vim.g.mapleader = " "

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'python', 'go', 'typescript' },
    auto_install = true,
    highlight = {
        enable = true,
    },
}

local luasnip = require('luasnip')
luasnip.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
}

-- LSP
require('nvim-lsp-setup').setup({
    default_mappings = true,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
    servers = {
        tsserver = {},
        gopls = {},
        pylsp = {},
        rust_analyzer = {},
        sumneko_lua = {
            single_file_support = true,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim', 'use' }
                    }
                }
            },
        },
    }
})

local lspkind = require('lspkind')
lspkind.init()

-- Completion
local cmp = require('cmp')
cmp.setup {
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                luasnip = "[snip]",
            }
        }
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
}


-- Harpoon
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

require('telescope').setup {
    defaults = {
        layout_strategy = 'center',
    },
}

require('telescope').load_extension('harpoon')

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, opts)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, opts)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, opts)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, opts)

vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opts)

local dap = require('dap')
vim.keymap.set('n', '<F4>', dap.terminate, opts)
vim.keymap.set('n', '<F5>', dap.continue, opts)
vim.keymap.set('n', '<F10>', dap.step_over, opts)
vim.keymap.set('n', '<F11>', dap.step_into, opts)
vim.keymap.set('n', '<F12>', dap.step_out, opts)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, opts)
vim.keymap.set('n', '<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
vim.keymap.set('n', '<leader>lp', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
vim.keymap.set('n', '<leader>dr', dap.repl.open, opts)
vim.keymap.set('n', '<leader>dl', dap.run_last, opts)
--
local dapui = require('dapui')
dapui.setup()

dap.listeners.after.event_initialized['dapui.config'] = function()
    dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

require('nvim-dap-virtual-text').setup()
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

require('nvim_comment').setup {
    comment_empty = false,
}
require('nvim-surround').setup()
require('hardline').setup {}

require('neogit').setup {}

local group = vim.api.nvim_create_augroup('fmt', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', { command = 'undojoin | Neoformat', group = group })
