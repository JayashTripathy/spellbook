# Git spells

# spell: serve the current repo over git:// (port 9418) — extra args go to git daemon
gserve() {
  local repo
  repo="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "gserve: not inside a git repository" >&2
    return 1
  }
  local name parent
  name="$(basename "$repo")"
  parent="$(dirname "$repo")"

  echo "Serving '$name' → git clone git://$(hostname -I | awk '{print $1}')/$name"
  git daemon \
    --reuseaddr \
    --base-path="$parent" \
    --export-all \
    --verbose \
    "$repo" "$@"
}
