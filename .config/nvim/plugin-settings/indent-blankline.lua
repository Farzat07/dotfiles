vim.api.nvim_set_hl(0, "IblScope",       { ctermfg = "Gray"     })
vim.api.nvim_set_hl(0, "IblWhitespace",  { ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "RainbowRed",     { ctermfg = "Red"      })
vim.api.nvim_set_hl(0, "RainbowYellow",  { ctermfg = "Yellow"   })
vim.api.nvim_set_hl(0, "RainbowBlue",    { ctermfg = "Blue"     })
vim.api.nvim_set_hl(0, "RainbowGreen",   { ctermfg = "Green"    })
vim.api.nvim_set_hl(0, "RainbowMagenta", { ctermfg = "Magenta"  })
vim.api.nvim_set_hl(0, "RainbowCyan",    { ctermfg = "Cyan"     })

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowGreen",
  "RainbowMagenta",
  "RainbowCyan",
}

require("ibl").setup {
  indent = {
    char = "›",
    highlight = highlight,
  },
}

vim.opt.list = true
vim.opt.listchars = {
  tab = "» ⇥",
  lead = "·",
  trail = "␣",
  nbsp = "⍽",
  extends = "❯",
  precedes = "❮",
  eol = "↴",
}
