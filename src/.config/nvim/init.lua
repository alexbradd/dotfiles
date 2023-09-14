if vim.env.TERM == "linux" or vim.env._IS_DEV_ENV ~= "true" then
  -- if tty or outside dev envirments disable fancy config and use a simple config
  require("simple")
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
