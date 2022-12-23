local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local install_plugins = false

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

install_plugins = ensure_packer()
if install_plugins then
  require("packer").sync()
end

require("packer").startup(function(use)
  -- Package manager
  use { "wbthomason/packer.nvim" }
  use { "lewis6991/impatient.nvim" }

  -- Tree Sitter plugins
  use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }
  use { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = "require('plugins.tree-sitter')",
  }

  -- Completions
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }
  --
  -- LSP
  --
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- LSP diagnostics and code actions

  -- Code/Workflow
  --

  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
    end,
  }
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, config = 'require("plugins.gitsigns")' }
  use { "simrat39/rust-tools.nvim" }
  use { "windwp/nvim-autopairs" }
  use { "sakhnik/nvim-gdb" }
  use { "L3MON4D3/LuaSnip" }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end,
  }
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = "require(plugins.telescope)",
    cmd = "Telescope",
  }

  -- Looks and themes
  use { "romgrk/barbar.nvim", wants = "nvim-web-devicons" }
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = 'require("plugins.nvim-tree")',
    cmd = "NvimTreeToggle",
  }
  use { "RRethy/nvim-base16" }
  use { "Mofiqul/vscode.nvim" }
  use { "yamatsum/nvim-cursorline" }
  use {
    "utilyre/barbecue.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "kyazdani42/nvim-web-devicons",
    },
    wants = "nvim-web-devicons",
    event = "BufWinEnter",
  }
  use { "glepnir/dashboard-nvim", event = "BufWinEnter", config = 'require("plugins.dashboard")' }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = 'require("plugins.lualine")',
  }
end)
