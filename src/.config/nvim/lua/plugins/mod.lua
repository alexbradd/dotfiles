local modifications = {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      enabled = function()
        return vim.g.cmp_enabled
      end,
    },
  },
}

if vim.env._IS_DEV_ENV == "true" then
  vim.list_extend(modifications, {
    {
      "mfussenegger/nvim-dap",
      opts = function(opts)
        require("dap.ext.vscode").load_launchjs(nil, { codelldb = { "c", "cpp" } })
        return opts
      end,
    },
  })
end

return modifications
