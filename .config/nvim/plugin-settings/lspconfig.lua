-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<space>sh", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set("n", "<space>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<space>f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  vim.api.nvim_set_option_value( -- Enable completion triggered by <c-x><c-o>
    "omnifunc",
    "v:lua.vim.lsp.omnifunc",
    { buf = bufnr }
  )
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local simple_servers = {
  "bashls",
  "clangd",
  "cssls",
  "emmet_language_server",
  "jedi_language_server",
  "jsonls",
  "remark_ls",
  "texlab",
  "vimls",
  "yamlls",
}
for _, lsp in ipairs(simple_servers) do
  vim.lsp.config(lsp, { capabilities = capabilities, on_attach = on_attach })
end

vim.lsp.config("lua_ls", {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        vim.uv.fs_stat(path .. "/.luarc.json")
        or vim.uv.fs_stat(path .. "/.luarc.jsonc")
      then
        return
      end
    end

    client.config.settings.Lua =
      vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using
          -- (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            -- Depending on the usage, you might want to add additional paths here.
            -- "${3rd}/luv/library"
            -- "${3rd}/busted/library",
          },
          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
          -- library = vim.api.nvim_get_runtime_file("", true)
        },
      })
  end,
  settings = {
    Lua = {},
  },
})
