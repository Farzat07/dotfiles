local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

--- Replace undercurls with underlines as tmux does not show undercurls
local function replace_undercurl_with_underline()
  local hlg = vim.api.nvim_get_hl(0, { link = true })
  for name, attributes in pairs(hlg) do
    if attributes.undercurl then
      attributes.undercurl = false
      attributes.underline = true
      vim.api.nvim_set_hl(0, name, attributes)
    end
  end
end

--- Remove the background attribute from the given highlight group
-- @param name string
local function remove_background(name)
  local attributes = vim.api.nvim_get_hl(0, { name = name })
  if attributes.bg then
    local without_bg = {}
    for k, v in pairs(attributes) do
      if k ~= "bg" then
        without_bg[k] = v
      end
    end
    vim.api.nvim_set_hl(0, name, without_bg)
  end
end

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  remove_background("Normal")
  remove_background("EndOfBuffer")
  replace_undercurl_with_underline() -- as tmux does not show undercurls
  vim.api.nvim_set_hl(0, "NonText",       { fg = "DarkGray" })
  vim.api.nvim_set_hl(0, "Whitespace",    { fg = "DarkGray" })
  vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

require("ibl").setup { indent = { char = "›", highlight = highlight, }, }

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
