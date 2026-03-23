if LANGUAGE_SERVER ~= "nvim-lspconfig" then
return {}
end

vim.lsp.enable("clangd")
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    -- Go to declaration
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- Go to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- Hover documentation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- List implementations
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- Signature help
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- Rename symbol
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    -- Code action (refactor, fix)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- References
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- Format buffer
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


return {{ "neovim/nvim-lspconfig" }}
