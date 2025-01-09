#!/bin/bash

# Path to dotfiles repository
DOTFILES_DIR="$HOME/Github/hyprland-dotfiles/dotfiles"

# Target directory for symlinks
CONFIG_DIR="$HOME/.config"

# Function to create symlinks recursively
create_symlinks() {
  local src_dir="$1"
  local dest_dir="$2"

  # Iterate over each item in the source directory
  for item in "$src_dir"/*; do
    local dest_item="$dest_dir/$(basename "$item")"

    if [[ -d "$item" ]]; then
      # If it's a directory, remove existing directory in destination
      if [[ -d "$dest_item" ]]; then
        echo "Removing existing directory: $dest_item"
        rm -rf "$dest_item" 
      fi
      # Create a directory in the destination
      mkdir -p "$dest_item"
      echo "Creating directory: $dest_item"
      create_symlinks "$item" "$dest_item"

    elif [[ -f "$item" ]]; then
      # If it's a file, remove existing file in destination
      if [[ -f "$dest_item" ]]; then
        echo "Removing existing file: $dest_item"
        rm "$dest_item"
      fi
      # Create a symlink
      ln -s "$item" "$dest_item"
      echo "Creating symlink for: $item -> $dest_item"
    fi
  done
}

# Call the function to create symlinks
create_symlinks "$DOTFILES_DIR" "$CONFIG_DIR"

echo "Symlinks created successfully!"
