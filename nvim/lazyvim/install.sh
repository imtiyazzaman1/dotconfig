SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

brew install lazygit gnu-sed

ln -s $SCRIPT_DIR ~/.config/nvim
