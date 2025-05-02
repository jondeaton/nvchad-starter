return {
  -- Themes :D
  "folke/tokyonight.nvim",
  "EdenEast/nightfox.nvim",
  "RRethy/vim-illuminate",
  "HUAHUAI23/nvim-quietlight",
  "catppuccin/nvim",
  "chiendo97/intellij.vim",
  "rafamadriz/neon",

  { -- Code folding.
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    },
    config = function()
      vim.o.foldcolumn = "1" -- Show a column for fold indicators
      vim.o.foldlevel = 99 -- Start with all folds open (UFO will manage them)
      vim.o.foldlevelstart = 99 -- Keep folds open when starting to edit a buffer
      vim.o.foldenable = true -- Enable folding

      -- Remap zR and zM to use UFO's functions for opening/closing all folds
      vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "UFO: Open All Folds" })
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "UFO: Close All Folds" })

      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          -- indentation folding fallback
          return { "treesitter", "indent" }
        end,
      }
    end,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   ---@module "ibl"
  --   ---@type ibl.config
  --   lazy = false,
  --   opts = {},
  --   config = function()
  --     require("ibl").setup()
  --   end,
  -- },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "pyformat", lsp_format = "fallback" },
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  { "nvim-cmp", enabled = false }, -- disable dog shit pre-packaged with nvchad

  { -- suprior completion plugin than nvim-cmp
    "Saghen/blink.cmp",
    tag = "v1.1.1",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      completion = {
        -- NOTE: this is the magical section that makes tab completion behave
        -- the way that I prefer.
        -- preselect=false means that when the completion menu shows up the
        -- first item isn't already select. That way when we press tab we'll
        -- select into the first item.
        -- auto_insert means that when we tab-through the list, we'll insert
        -- each into into the line as we go.
        list = { selection = { preselect = false, auto_insert = true } },
      },
      fuzzy = {
        -- implementation = "prefer_rust_with_warning",
        -- implementation = "prefer_rust" | "lua",
        implementation = "lua",
      },
      keymap = {
        -- ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-N>"] = { "select_next", "show" },
        ["<C-P>"] = { "select_prev", "show" },
        ["<C-J>"] = { "select_next", "fallback" },
        ["<C-K>"] = { "select_prev", "fallback" },
        -- ["<C-U>"] = { "scroll_documentation_up", "fallback" },
        -- ["<C-D>"] = { "scroll_documentation_down", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" }, -- OK as long as preselect=false
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lspconfig = require "lspconfig"
      local lsp_configs = require "lspconfig.configs"

      lsp_configs.ciderlsp = {
        default_config = {
          cmd = {
            "/google/bin/releases/cider/ciderlsp/ciderlsp",
            "--tooltag=nvim-lsp",
            "--noforward_sync_responses",
          },
          filetypes = {
            "c",
            "cpp",
            "java",
            "kotlin",
            "objc",
            "proto",
            "textpb",
            "go",
            "python",
            "bzl",
            "typescript",
          },
          offset_encoding = "utf-8",
          root_dir = nvim_lspconfig.util.root_pattern ".citc",
          settings = {},
        },
      }

      nvim_lspconfig.ciderlsp.setup {}

      lsp_configs.analysislsp = {
        default_config = {
          cmd = {
            "/google/bin/users/lerm/glint-ale/analysis_lsp/server",
            "--lint_on_save=false",
            "--max_qps=10",
          },
          filetypes = { "cpp", "proto", "textproto", "python", "bzl" },
          -- root_dir = lspconfig.util.root_pattern('BUILD'),
          root_dir = function(fname)
            return string.match(fname, "(/google/src/cloud/[%w_-]+/[%w_-]+/).+$")
          end,
          settings = {},
        },
        -- setup {
        --   -- capabilities = capabilities,
        --   -- on_attach = on_attach,
        -- },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "vim", "lua", "python", "cpp" },
    },
  },

  -- for when ai slop is good enough
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "gemini",
      gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-2.5-flash-preview-04-17",
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
