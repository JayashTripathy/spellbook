# 📖 Jayash's Spellbook

My personal book of shell spells: small incantations I've collected over time, ready to cast from any terminal.

Every spell lives in `spells/`, and the book loads them all whenever a new shell opens.

## Opening the book

```bash
./install.sh        # adds one line to ~/.bashrc
source ~/.bashrc
spells              # list every spell in the book
```

## Spells

| Spell    | What it does                                                           |
|----------|------------------------------------------------------------------------|
| `gserve` | Serves the current repo over `git://` so anyone on the LAN can clone it |

### ✦ gserve

```bash
cd any/repo
gserve                          # → git clone git://<your-ip>/<repo>
gserve --port=9500              # custom port
gserve --enable=receive-pack    # allow pushes (trusted networks only!)
```

Needs port 9418 open (`sudo ufw allow 9418/tcp`). `git://` has no encryption and no auth, so use it on a LAN only.

## Writing a new spell

1. Pick a file in `spells/`, or start a new one (`spells/<topic>.sh`).
2. Write the function with a `# spell:` comment directly above it:

   ```bash
   # spell: one-line description shown by `spells`
   myspell() {
     ...
   }
   ```

3. Run `source ~/.bashrc`, and the spell is ready to cast.
