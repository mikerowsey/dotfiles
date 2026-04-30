#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
ESPANSO_DIR="$DOTFILES_DIR/espanso"
TARGET_DIR="$HOME/Library/Application Support/espanso"

echo "==> Installing Espanso (if not present)..."
if ! command -v espanso >/dev/null 2>&1; then
  if command -v brew >/dev/null 2>&1; then
    brew install espanso
  else
    echo "Homebrew not found. Install it first."
    exit 1
  fi
fi

echo "==> Creating dotfiles structure..."
mkdir -p "$ESPANSO_DIR"/{config,match}

echo "==> Creating default config (if missing)..."
if [ ! -f "$ESPANSO_DIR/config/default.yml" ]; then
  cat >"$ESPANSO_DIR/config/default.yml" <<EOF
# espanso config
backend: auto
EOF
fi

echo "==> Creating base snippets (if missing)..."
if [ ! -f "$ESPANSO_DIR/match/base.yml" ]; then
  cat >"$ESPANSO_DIR/match/base.yml" <<EOF
matches:
  - trigger: ";sig"
    replace: |
      Best regards,
      Michael
      Operations Manager
      Tokistar Lighting
EOF
fi

echo "==> Linking Espanso config..."
if [ -L "$TARGET_DIR" ] || [ -d "$TARGET_DIR" ]; then
  rm -rf "$TARGET_DIR"
fi

ln -s "$ESPANSO_DIR" "$TARGET_DIR"

echo "==> Starting Espanso..."
espanso start

echo "==> Setup complete."
