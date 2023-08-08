return {

  -- nvim tree
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',

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
