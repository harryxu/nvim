require("lazyvim.config").init()

return {

  -- nvim tree
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
      })
      vim.keymap.set({'n', 'i', 'v'}, '<F3>', '<ESC>:NvimTreeToggle<CR>')
    end,
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
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
  'romgrk/barbar.nvim',

  -- Find, Filter, Preview, Pick.
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  'airblade/vim-gitgutter',

  -- Codeium
  'Exafunction/codeium.vim',

  -- Seamless navigation between tmux panes and vim splits
  'christoomey/vim-tmux-navigator',

  -- Color themes
  'bling/vim-airline',
  { 'mkarmona/colorsbox', lazy = true },
  'EdenEast/nightfox.nvim',

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordfox",
    },
  }

}
