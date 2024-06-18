if vim.env.TERM == "linux" then
  -- if tty disable fancy config and use a simple config
  require("simple")
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
