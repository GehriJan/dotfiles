# Path to your dotfiles repository
DOTFILES_REPO_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../ && pwd )"
echo "Repo path $DOTFILES_REPO_PATH"

# Define system paths and their corresponding repo paths
SYSTEM_PATHS=(
  "$HOME/.bash_profile"
  "$HOME/.vimrc"
  "$HOME/.zshrc"
  "$HOME/.config/nvim"
  "$HOME/Library/Application Support/Code/User/settings.json"
  "$HOME/Library/Application Support/Code/User/keybindings.json"
)
REPO_PATHS=(
  "$DOTFILES_REPO_PATH/.bash_profile"
  "$DOTFILES_REPO_PATH/.vimrc"
  "$DOTFILES_REPO_PATH/.zshrc"
  "$DOTFILES_REPO_PATH/"
  "$DOTFILES_REPO_PATH/vscode/settings.json"
  "$DOTFILES_REPO_PATH/vscode/keybindings.json"
)

# Loop through each path-pair
for i in "${!SYSTEM_PATHS[@]}"; do
  SYSTEM_PATH="${SYSTEM_PATHS[$i]}"
  REPO_PATH="${REPO_PATHS[$i]}"

  # Check if the system file exists
  if [ -e "$SYSTEM_PATH" ]; then
    echo "Copying $SYSTEM_PATH to $REPO_PATH"
    # Copy the file from system to repo, overwriting existing files
    cp -rf "$SYSTEM_PATH" "$REPO_PATH"
  else
    echo "Warning: $SYSTEM_PATH does not exist, skipping."
  fi
done
echo "Pulled files from system."


echo "Dotfiles sync complete."
