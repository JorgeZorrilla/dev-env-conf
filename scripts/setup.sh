#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "$HOME/.config" "$HOME/.tmux/plugins"

link() {
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    echo "Already linked: $dst"
  elif [ -e "$dst" ]; then
    echo "Existing file left untouched: $dst"
  else
    ln -s "$src" "$dst"
    echo "Linked $dst -> $src"
  fi
}

link "$ROOT/nvim" "$HOME/.config/nvim"
link "$ROOT/tmux/tmux.conf" "$HOME/.tmux.conf"
link "$ROOT/zsh/.zshrc" "$HOME/.zshrc"

if command -v git >/dev/null 2>&1 && [ ! -d "$HOME/.tmux/plugins/tpm/.git" ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" || echo "TPM clone failed; install it later."
fi

cat <<'MSG'

Setup linked.

Next steps:
  1. Ensure Neovim >= 0.11.3 is installed.
  2. Start `nvim`; lazy.nvim will bootstrap and install plugins.
  3. Commit the generated `nvim/lazy-lock.json` to freeze exact plugin commits.
  4. Start tmux and press Prefix + I (Ctrl-a then Shift-I) once to install TPM plugins.

Recommended system tools:
  tmux zsh git rg fd fzf zoxide direnv lazygit lazydocker
  clang clangd clang-format clang-tidy cmake ninja gdb
  rust-analyzer cargo
  python basedpyright ruff
  ada_language_server GNAT Alire
  node/npm (for web language servers/Prettier/ESLint)
  ollama
MSG
