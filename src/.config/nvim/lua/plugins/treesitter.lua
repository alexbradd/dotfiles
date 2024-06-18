return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ignore_install = {},
      ensure_installed = {
        -- Programming languages
        "bash",
        "c",
        "cpp",
        "rust",
        "python",
        "lua",

        -- Config files
        "json",
        "vim",
        "toml",
        "yaml",

        -- Markup
        "markdown",
        "latex",

        -- Build systems
        "cmake",
        "make",
        "meson",

        -- Misc
        "diff",
        "gitcommit",
        "vimdoc",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      textobjects = {
        enable = true,
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
        },
      },
    },
  },
}
