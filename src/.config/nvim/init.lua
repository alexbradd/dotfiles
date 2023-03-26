if vim.env.TERM == "linux" then
  -- if tty disable fancy config and use defaults
  vim.opt.guicursor = { a = "ver100" }
  vim.cmd("colorscheme default")
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
