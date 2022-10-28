--
-- File: lua/mapfn.lua
-- Verison: 22.10.0
--

local m = {}

m.noremap = function(mode, map, func)
  vim.keymap.set(mode, map, func, { noremap = true, silent = true })
end

m.noremapBuf = function(mode, map, func, buf)
  vim.keymap.set(mode, map, func, { noremap = true, silent = true, buffer = buf})
end

return m
