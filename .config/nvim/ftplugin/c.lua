vim.api.nvim_buf_create_user_command(0, "ToggleComment", function()
  if
    require("Comment.ft").get("c", require("Comment.utils").ctype.linewise)
    == "//%s"
  then
    require("Comment.ft").set("c", "/*%s*/")
  else
    require("Comment.ft").set("c", "//%s")
  end
end, {})
