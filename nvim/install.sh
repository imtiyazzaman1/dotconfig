SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

brew install nvim fzf bat delta fd

ln -s $SCRIPT_DIR/nvim ~/.config/nvim

nvim --headless +qa
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
