#!/bin/bash

# Path to your dotfiles repository
DOTFILES_REPO_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../ && pwd )"
echo "Repo path $DOTFILES_REPO_PATH"

# Define the list of path-pairs: (System path -> Repo path)
declare -A PATH_PAIRS=(
  ["$HOME/.bash_profile"]="$DOTFILES_REPO_PATH/.bash_profile"
  ["$HOME/.vimrc"]="$DOTFILES_REPO_PATH/.vimrc"
  ["$HOME/.zshrc"]="$DOTFILES_REPO_PATH/.zshrc"
  ["$HOME/.gitconfig"]="$DOTFILES_REPO_PATH/.gitconfig"
  ["$HOME/.config/nvim"]="$DOTFILES_REPO_PATH/nvim"
  ["$HOME/Library/Application Support/Code/User/settings.json"]="$DOTFILES_REPO_PATH/vscode/settings.json"
  ["$HOME/Library/Application Support/Code/User/keybindings.json"]="$DOTFILES_REPO_PATH/vscode/keybindings.json"
)

# Loop through each path-pair
for SYSTEM_PATH in "${!PATH_PAIRS[@]}"; do
  REPO_PATH="${PATH_PAIRS[$SYSTEM_PATH]}"

  # Check if the system file exists
  if [ -e "$SYSTEM_PATH" ]; then
    echo "Copying $SYSTEM_PATH to $REPO_PATH"
    # Copy the file from system to repo, overwriting existing files
    cp -rf "$SYSTEM_PATH" "$REPO_PATH"
  else
    echo "Warning: $SYSTEM_PATH does not exist, skipping."
  fi
done

echo "Dotfiles sync complete."
