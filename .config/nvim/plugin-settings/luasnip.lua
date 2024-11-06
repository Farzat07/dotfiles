local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

local opts = { noremap = true, silent = true }

vim.keymap.set("i", "<C-l>", function()
  luasnip.expand()
end, opts)
vim.keymap.set("s", "<C-l>", function()
  luasnip.expand()
end, opts)
vim.keymap.set("i", "<C-k>", function()
  if luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end, opts)
vim.keymap.set("s", "<C-k>", function()
  if luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end, opts)
vim.keymap.set("i", "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, opts)
vim.keymap.set("s", "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, opts)
