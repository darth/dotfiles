local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {noremap = true, silent = true}
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa',
                 '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr',
                 '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl',
                 '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                 opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                 opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e',
                 '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q',
                 '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                   opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                   opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  require'completion'.on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {'pyls', 'sourcegraph_js', 'yamlls'}
for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end

nvim_lsp['ccls'].setup {
  capabilities = capabilities,
  init_options = {
    compilationDatabaseDirectory = 'build',
    cache = {directory = '/tmp/ccls-cache'},
    highlight = {lsRanges = true},
    client = {snippetSupport = true}
  },
  on_attach = on_attach
}

local system_name
if vim.fn.has('mac') == 1 then
  system_name = 'macOS'
elseif vim.fn.has('unix') then
  system_name = 'Linux'
elseif vim.fn.has('win32') then
  system_name = 'Windows'
else
  print('Unsupported system for sumneko')
end

local sumneko_root = vim.fn.expand('$LUA_LS_ROOT')
local sumneko_bin = sumneko_root .. '/bin/' .. system_name ..
                        '/lua-language-server'

nvim_lsp['sumneko_lua'].setup {
  cmd = {sumneko_bin, "-E", sumneko_root .. '/main.lua'},
  settings = {
    Lua = {
      runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
      diagnostics = {globals = {'vim'}},
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      }
    }
  },
  on_attach = on_attach
}
