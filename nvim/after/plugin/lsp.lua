-- =============================================================================
-- Native LSP on Neovim 0.12+ (no lsp-zero, no nvim-lspconfig)
-- Requires: mason.nvim, mason-lspconfig.nvim, nvim-cmp, cmp-nvim-lsp
-- =============================================================================

-- Keep logs small
-- vim.lsp.set_log_level('WARN')

-- Capabilities (nvim-cmp)
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- UI borders
local border = 'single'
vim.lsp.handlers['textDocument/hover']         = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
vim.diagnostic.config({ float = { border = border } })

-- on_attach: your keymaps (gd, etc.)
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd",  vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

-- Diagnostics behavior
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { virtual_text = true, signs = true, update_in_insert = false, underline = true }
)

-- Mason setup (ensure its bin is on PATH so clangd/pylsp can start)
require('mason').setup({ PATH = "prepend" })

-- Which servers to install
require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'clangd',
    'pylsp',
    'cmake',
    'lua_ls',
    'yamlls',
    'typos_lsp',
    'bashls',
    'vimls',
  },

  handlers = {
    -- Default handler for unspecified servers
    function(server)
      vim.lsp.config(server, {
        capabilities = lsp_capabilities,
        on_attach = on_attach,
        single_file_support = true,
      })
      vim.lsp.enable(server)
    end,

    -- clangd (C/C++)
    clangd = function()
      vim.lsp.config('clangd', {
        capabilities = lsp_capabilities,
        on_attach = on_attach,
        cmd = { 'clangd' },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        root_dir = function(fname)
          local found = vim.fs.find(
            { '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json',
              'compile_flags.txt', 'configure.ac', '.git' },
            { path = fname, upward = true }
          )[1]
          return found and vim.fs.dirname(found) or vim.loop.cwd()
        end,
        single_file_support = true,
      })
      vim.lsp.enable('clangd')
    end,

    -- Python (pylsp)
    pylsp = function()
      vim.lsp.config('pylsp', {
        capabilities = lsp_capabilities,
        on_attach = on_attach,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = {
                  'E265','E266','E221','E241','E303','E305','E203','E701','E302','W291','W293'
                },
                maxLineLength = 120,
              },
            },
          },
        },
      })
      vim.lsp.enable('pylsp')
    end,

    -- typos-lsp
    typos_lsp = function()
      vim.lsp.config('typos_lsp', {
        capabilities = lsp_capabilities,
        on_attach = on_attach,
        root_dir = function(fname)
          local found = vim.fs.find(
            { 'typos.toml', '_typos.toml', '.typos.toml', '.git' },
            { path = fname, upward = true }
          )[1]
          return found and vim.fs.dirname(found) or vim.loop.cwd()
        end,
      })
      vim.lsp.enable('typos_lsp')
    end,

    -- bashls
    bashls = function()
      vim.lsp.config('bashls', {
        capabilities = lsp_capabilities,
        on_attach = on_attach,
        filetypes = { "sh" },
        single_file_support = true,
      })
      vim.lsp.enable('bashls')
    end,

    -- cmake
    cmake = function()
      vim.lsp.config('cmake', {
        capabilities = lsp_capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable('cmake')
    end,
  },
})

-- nvim-cmp (unchanged)
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-p>']     = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>']     = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>']     = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>']     = function() end,
    ['<S-Tab>']   = function() end,
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  },
})

-- Make sure Mason puts its bin (clangd, pylsp, …) on PATH
require('mason').setup({ PATH = "prepend" })

-- Safety net: explicitly start clangd on C-family buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp', 'objc', 'objcpp' },
  callback = function(args)
    if vim.fn.executable('clangd') ~= 1 then
      vim.notify('clangd not found on PATH', vim.log.levels.ERROR)
      return
    end

    -- Skip if clangd already attached
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
      if client.name == 'clangd' then return end
    end

    local fname = vim.api.nvim_buf_get_name(args.buf)
    local root_marker = vim.fs.find({
      '.git', 'compile_commands.json', '.clangd', '.clang-tidy',
      '.clang-format', 'compile_flags.txt', 'configure.ac',
    }, { path = fname, upward = true })[1]
    local root = root_marker and vim.fs.dirname(root_marker) or vim.loop.cwd()

    vim.lsp.start({
      name = 'clangd',
      cmd = { 'clangd' },
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = function(client, bufnr)
        -- your original on_attach keymaps
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd",  vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.notify('LSP attached: clangd @ ' .. root)
      end,
      root_dir = root,           -- use computed project root
      single_file_support = true,
    })
  end,
})


