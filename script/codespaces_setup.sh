#!/bin/bash
set -e

# Fix permissions for the Codespaces workspace
sudo chown -R docker:docker .

# Copy all .yml.example files to .yml if they don't already exist
for f in config/*.yml.example; do
  dest="${f%.example}"
  if [ ! -f "$dest" ]; then
    cp "$f" "$dest"
    echo "Copied $f to $dest"
  fi
done

# Ensure .env exists
if [ ! -f .env ]; then
  touch .env
  echo "Created .env"
fi

# Additional setup for Canvas can be added here if needed
# For example, running migrations or assets build, though that's better in postCreateCommand
