local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- nvim tree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- The neovim tabline plugin
  use 'romgrk/barbar.nvim'

  use 'airblade/vim-gitgutter'

  -- Codeium
  use 'Exafunction/codeium.vim'

  -- Seamless navigation between tmux panes and vim splits
  use 'christoomey/vim-tmux-navigator'

  -- Color themes
  use 'bling/vim-airline'
  use 'mkarmona/colorsbox'
  use 'EdenEast/nightfox.nvim'


  if packer_bootstrap then
    require('packer').sync()
  end
end)
