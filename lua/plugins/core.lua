require("lazyvim.config").init()

local Util = require("lazyvim.util")

return {

  { "folke/lazy.nvim", version = "*" },

  {
    "LazyVim/LazyVim", priority = 10000, lazy = false, config = true, cond = true, version = "*",
    opts = {
      colorscheme = "nordfox",
    },
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      { "<C-L>", function() require("luasnip").jump(1) end, silent = true, mode = {"i", "s"} },
      { "<C-H>", function() require("luasnip").jump(-1) end, silent = true, mode = { "i", "s" } },
    },
  },

  -- auto completion
  {
    'hrsh7th/nvim-cmp',
    version = false, -- last release is way too old
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'octaltree/cmp-look',
    },
    opts = function()
      -- vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
      local cmp = require('cmp')
      local defaults = require('cmp.config.default')()
      return {
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<S-CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          {
            name = 'look',
            keyword_length = 3,
            option = {
                convert_case = true,
                loud = true
            }
          }
        }),
        sorting = defaults.sorting,
      }
    end,
  },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {} -- this is equalent to setup({}) function
  },

  -- The neovim tabline plugin
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    -- init = function() vim.g.barbar_auto_setup = false end,
  },

  -- Find, Filter, Preview, Pick.
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<C-P>", Util.telescope("files"), desc = "Find Files (root dir)" },
    }
  },

  'airblade/vim-gitgutter',

  -- Codeium
  'Exafunction/codeium.vim',

  -- Seamless navigation between tmux panes and vim splits
  'christoomey/vim-tmux-navigator',

  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    config = function()
      require('leap').create_default_mappings()
    end,
  },

  -- Color themes
  'bling/vim-airline',
  { 'mkarmona/colorsbox', lazy = true },
  'EdenEast/nightfox.nvim',

}
