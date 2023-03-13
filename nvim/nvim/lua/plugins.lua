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
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

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
