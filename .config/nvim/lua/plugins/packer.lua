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

	-- Tree Sitter plugins
	use {'windwp/nvim-ts-autotag'}
	use {'p00f/nvim-ts-rainbow'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

	-- Completions
	use {'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {'hrsh7th/cmp-buffer'}
	use {"hrsh7th/cmp-nvim-lsp"}
	use {"hrsh7th/cmp-nvim-lua"}
	--
	-- LSP
	--
	use {'neovim/nvim-lspconfig'}
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	use {'jose-elias-alvarez/null-ls.nvim'} -- LSP diagnostics and code actions

	-- Code/Workflow
	--

	use {'windwp/nvim-autopairs'}
	use {'sakhnik/nvim-gdb'}
	use {'L3MON4D3/LuaSnip'}
	use { 
		'folke/which-key.nvim',
	config = function()
		require("which-key").setup {
		}
	end
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Looks and themes
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use {'RRethy/nvim-base16'}
	use {'Mofiqul/vscode.nvim'}
	use {'yamatsum/nvim-cursorline'}
	use {
		"utilyre/barbecue.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"smiteshp/nvim-navic",
			"kyazdani42/nvim-web-devicons", 
		},
		after = "nvim-web-devicons", 
		config = function()
			require("barbecue").setup()
		end,
	}
	use {'glepnir/dashboard-nvim'}
	use {'nvim-lualine/lualine.nvim',  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

end)
