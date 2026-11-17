# spellbook — loads every spell in spells/*.sh into the current shell.
# Sourced from ~/.bashrc by install.sh. Don't execute this file directly.

SPELLBOOK_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export SPELLBOOK_HOME

for _spell in "$SPELLBOOK_HOME"/spells/*.sh; do
  [ -r "$_spell" ] && . "$_spell"
done
unset _spell

# List every available spell with its one-line description.
# Convention: put a "# spell: <description>" comment right above each function.
spells() {
  grep -h -A1 '^# spell:' "$SPELLBOOK_HOME"/spells/*.sh \
    | awk '/^# spell:/ { sub(/^# spell: */, ""); desc=$0; next }
           /\(\)/      { name=$1; sub(/\(\).*/, "", name); printf "  \033[1m%-14s\033[0m %s\n", name, desc }'
}
