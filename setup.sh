#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

brew bundle

for d in */; do
    [[ "${d%/}" == ".git" ]] && continue
    stow --no-folding --restow "${d%/}"
done

if [[ "$(uname)" == "Darwin" ]]; then
    dir="$HOME/Library/Application Support/com.mitchellh.ghostty"
    cfg="$HOME/.config/ghostty/config"
    [[ -f "$cfg" ]] && mkdir -p "$dir" && ln -sf "$cfg" "$dir/config.ghostty"
fi

grep -qF "# dotfiles" ~/.zshrc 2>/dev/null || cat zshrc >> ~/.zshrc
