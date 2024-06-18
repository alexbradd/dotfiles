local o = vim.opt_local
local b = vim.b

o.formatoptions:append("t")
o.textwidth = 80
o.spell = true
o.conceallevel = 0

b.indent_blankline_enabled = false
b.minisurround_config = {
  custom_surroundings = {
    ["i"] = { output = { left = "_", right = "_" } },
    ["b"] = { output = { left = "**", right = "**" } },
  },
}
