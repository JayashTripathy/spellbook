#!/usr/bin/env bash
# Hooks spellbook into ~/.bashrc. Safe to run more than once.
set -euo pipefail

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rc="$HOME/.bashrc"
line="[ -f \"$dir/spellbook.sh\" ] && . \"$dir/spellbook.sh\"  # spellbook"

if grep -qF "# spellbook" "$rc" 2>/dev/null; then
  echo "spellbook is already in $rc"
else
  printf '\n%s\n' "$line" >> "$rc"
  echo "Added spellbook to $rc"
fi

echo "Run 'source ~/.bashrc' (or open a new terminal), then type 'spells' to list them."
