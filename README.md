# 📖 spellbook

A collection of shell spells: small functions that are available in every terminal.

## Install

```bash
./install.sh
source ~/.bashrc
spells          # list everything in the book
```

## Spells

| Spell    | What it does                                                      |
|----------|-------------------------------------------------------------------|
| `gserve` | Serve the current repo over `git://` so others on the LAN can clone it |

### gserve

```bash
cd any/repo
gserve                          # → git clone git://<your-ip>/<repo>
gserve --port=9500              # custom port
gserve --enable=receive-pack    # allow pushes (trusted networks only!)
```

Needs port 9418 open (`sudo ufw allow 9418/tcp`). `git://` has no encryption and no auth, so use it on a LAN only.

## Adding a spell

1. Pick a file in `spells/` (or create `spells/<topic>.sh`).
2. Write a function with a `# spell:` comment directly above it:

   ```bash
   # spell: one-line description shown by `spells`
   myspell() {
     ...
   }
   ```

3. Run `source ~/.bashrc`, and it's ready to use.
