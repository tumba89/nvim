local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "clangd",
    "csharp_ls",
    "cmake",
    "cssls",
    "dockerls",
    "emmet_ls",
    "graphql",
    "html",
    "htmx",
    "jsonls",
    "tsserver",
    "lua_ls",
    "sqlls",
    "rust_analyzer",
    "svelte",
    "pylsp",
    "tailwindcss",
    "lemminx"
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp_action.toggle_completion(),
  }
})
