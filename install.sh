#!/usr/bin/env bash
set -euo pipefail

# Run from the repo root regardless of where the script is called from
cd "$(dirname "$0")"
DOTFILES=$PWD

# Symlink $DOTFILES/$1 to $2. Anything real already at $2 is moved aside first.
link() {
  local src="$DOTFILES/$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    local backup
    backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "Moved existing $dest to $backup"
  fi
  ln -sfn "$src" "$dest"
  echo "Linked $dest"
}

brew bundle --file=Brewfile || echo "Warning: brew bundle failed, continuing" >&2

# Git name/email go in ~/.gitconfig.local so they stay out of the repo.
# Defaults come from the existing global config, then from GitHub via gh.
if ! git config --file ~/.gitconfig.local user.email >/dev/null 2>&1; then
  default_name=$(git config --global user.name || gh api user -q .name 2>/dev/null || true)
  default_email=$(git config --global user.email || gh api user/emails -q '.[] | select(.primary) | .email' 2>/dev/null || gh api user -q '.email // empty' 2>/dev/null || true)
  read -rp "Git name [$default_name]: " name
  read -rp "Git email [$default_email]: " email
  git config --file ~/.gitconfig.local user.name "${name:-$default_name}"
  git config --file ~/.gitconfig.local user.email "${email:-$default_email}"
fi

# Trust our own signing key so git can verify signatures locally
signer="$(git config --file ~/.gitconfig.local user.email) $(git config --file gitconfig user.signingkey)"
mkdir -p ~/.config/git
touch ~/.config/git/allowed_signers
grep -qxF "$signer" ~/.config/git/allowed_signers || echo "$signer" >> ~/.config/git/allowed_signers

link gitconfig         ~/.gitconfig
link starship.toml    ~/.config/starship.toml
link fish/config.fish    ~/.config/fish/config.fish
link fish/functions    ~/.config/fish/functions
link vscode/settings.json ~/Library/"Application Support"/Code/User/settings.json

# VS Code extensions (general ones only; language extensions belong to projects)
if command -v code >/dev/null; then
  while read -r ext; do
    [ -n "$ext" ] && code --install-extension "$ext" >/dev/null
  done < vscode/extensions.txt
  echo "VS Code extensions installed"
else
  echo "Warning: VS Code 'code' command not found, skipping extensions" >&2
fi

# 1Password shell plugin for Heroku: keeps the API key in 1Password instead of ~/.netrc.
# Interactive: it asks which 1Password item holds the key, then writes ~/.config/op/plugins.sh
if command -v op >/dev/null && [ ! -f ~/.config/op/plugins/heroku.json ]; then
  echo "Setting up the 1Password Heroku plugin"
  op plugin init heroku || echo "Warning: Heroku plugin setup failed, run 'op plugin init heroku' later" >&2
fi

./macos/setup.sh
