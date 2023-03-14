local M = {}

function M.setup()
  local conf = {
    profile = {
      enable = true,
      threshold = 0,
    },
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    }
  }

  local function ensure_packer()
    local bootstrap = false

    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      bootstrap = true
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    return bootstrap
  end

  local function plugins(use)
    use 'wbthomason/packer.nvim'

    -- Load only when required
    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Theme
		use {
			"sainnhe/everforest",
			config = function()
				vim.cmd "colorscheme everforest"
			end,
		}

    -- Start screen
    use {
      'goolord/alpha-nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
		}

    -- Git
    use {
      "TimUntersberger/neogit",
			cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

		-- WhichKey
		use {
			event = "VimEnter",
			"folke/which-key.nvim",
			config = function()
				require("config.whichkey").setup()
			end,
		}

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Easy hopping
    use {
      "phaazon/hop.nvim",
      cmd = { "HopWord", "HopChar1" },
      config = function()
        require("hop").setup {}
      end,
    }

    -- Easy motion
    use {
      "ggandor/lightspeed.nvim",
      keys = { "s", "S", "f", "F", "t", "T" },
      config = function()
        require("lightspeed").setup {}
      end,
    }
		
		-- Status Line
		use {
		  "nvim-lualine/lualine.nvim",
			event = "VimEnter",
			config = function()
			 require("config.lualine").setup()
			end,
			requires = { "nvim-web-devicons" },
		}
		
		-- Current code context
		use {
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
			module = "nvim-gps",
			config = function()
				require("nvim-gps").setup()
			end,
		}

		-- Treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			 run = ":TSUpdate",
			 config = function()
				 require("config.treesitter").setup()
			 end,
		}

		-- FZF
		use { "junegunn/fzf", run = "./install --all" }
		use { "junegunn/fzf.vim" }
		use {
		 "ibhagwan/fzf-lua",
			requires = { "kyazdani42/nvim-web-devicons" },
		}

		-- File Explorer
		use {
		 "kyazdani42/nvim-tree.lua",
		 requires = {
			 "kyazdani42/nvim-web-devicons",
		 },
		 cmd = { "NvimTreeToggle", "NvimTreeClose" },
			 config = function()
				 require("config.nvimtree").setup()
			 end,
		}

		-- Buffer line
		use {
			"akinsho/nvim-bufferline.lua",
			event = "BufReadPre",
			wants = "nvim-web-devicons",
			config = function()
				require("config.bufferline").setup()
			end,
		}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    local packer_bootstrap = ensure_packer()
    if packer_bootstrap then
      require('packer').sync()
    end
  end


  local packer = require("packer")
  packer.init(conf)
  packer.startup(plugins)
end

return M
