local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

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

install_plugins = ensure_packer()
if install_plugins then
	require('packer').sync()
end

require('packer').startup(function(use)
	-- Package manager
	use {'wbthomason/packer.nvim'}

	-- Theme inspired by Atom
	use {'RRethy/nvim-base16'}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	use {'utilyre/barbecue.nvim'}

	use {'Mofiqul/vscode.nvim'}

	use {'yamatsum/nvim-cursorline'}

	use {'nvim-lualine/lualine.nvim',  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

end)
