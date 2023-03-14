SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

brew nvim jdtls fzf bat delta fd

echo 'alias vi=nvim' >> ~/.zshrc
echo 'Added vi alias for nvim to zshrc'
