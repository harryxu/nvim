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

}
