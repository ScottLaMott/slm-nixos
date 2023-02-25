local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself

  -- my plugins here --------------------------------------------------
  -- colorschemes
  use 'folke/tokyonight.nvim'
  use 'rockerBOO/boo-colorscheme-nvim'
  use 'rebelot/kanagawa.nvim'
  use 'LunarVim/onedarker.nvim'
  use 'shaunsingh/nord.nvim'
  use 'metalelf0/jellybeans-nvim'

  -- goyo
  use 'junegunn/goyo.vim'
  -- nix syntax file
  use 'LnL7/vim-nix'
 
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
 
  -- telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} } }
 
  -- markdown-preview
  use{ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }
 
  -- lualine
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- 
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  --use { "kyazdani42/nvim-web-devicons" }
  use { "tpope/vim-fugitive" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
