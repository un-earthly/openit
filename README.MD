 # 🌀 openit — The Smart Project Opener for Your Terminal

**openit** is a simple, powerful Bash utility that helps you open any project instantly in your favorite editor — Windsurf, Cursor, VS Code, or any other tool you like.

Instead of typing long, repetitive commands like:

```bash
cd ~/Desktop/projects/spectrum && windsurf .
````

You can simply run:

```bash
openit spectrum
```

…and the right project will open in your preferred editor.
---

## 🚀 Features

- **Quick open** — Launch any project in seconds
- **Fuzzy matching** — Partial names are enough (`openit spec` → `spectrum`)
- **Works with your editor** — Windsurf, Cursor, VS Code, Sublime, JetBrains, etc.
- **Configurable** — Set your projects directory and editor command
- **Autocomplete** — Bash completion installed automatically
- **Tiny & dependency-free** — Pure Bash

---

## 📋 Prerequisites

- Linux with Bash
- Your editor’s CLI on PATH (e.g. `windsurf`, `cursor`, `code`, `subl`, `idea`)
- Projects stored under a single directory (default `~/Desktop/projects`)

---

## 📦 Install

1. Clone

   ```bash
   git clone https://github.com/un-earthly/openit.git
   cd openit
   ```

2. Install the command and Bash completion

   ```bash
   sudo ./install.sh
   ```

   This creates `/usr/local/bin/openit` (symlink to `openit.sh`) and installs Bash completion.

3. Configure (optional but recommended)

   `openit.sh` reads `config.env` placed alongside the installed script. Because the installed command lives at `/usr/local/bin/openit`, place your config at:

   ```bash
   sudo tee /usr/local/bin/config.env >/dev/null <<'ENV'
   PROJECTS_DIR=~/Desktop/projects
   EDITOR_CMD=windsurf
   ENV
   ```

   Tip: you can also keep the repo directory and run `./openit.sh` directly; in that case, put `config.env` next to `openit.sh`.

4. Verify

   ```bash
   openit
   ```

   You should see usage and a list of folders under `PROJECTS_DIR`.

---

## ⚙️ Configuration

`config.env` variables:

```bash
# Directory containing all your projects
PROJECTS_DIR=~/Desktop/projects

# Editor CLI command
# Supported examples: windsurf, cursor, code, subl, idea
EDITOR_CMD=windsurf
```

Change editor:

```bash
EDITOR_CMD=cursor   # or: code, subl, idea
```

Change projects root:

```bash
PROJECTS_DIR=~/workspace
```

---

## 🧩 Usage

```bash
# Open by full name
openit spectrum

# Open by partial (fuzzy) name
openit spec

# List available projects
openit
```

If no match is found, you’ll get a helpful message.

---

## 🧠 Autocompletion (Bash)

`install.sh` installs a completion script at `/etc/bash_completion.d/openit`.

- Reload your shell if completion doesn’t work immediately:

  ```bash
  source ~/.bashrc
  ```

Zsh: a minimal completion function you can add to `~/.zshrc`:

```bash
_openit_complete() {
  local -a projects
  projects=(${(f)"$(ls ~/Desktop/projects)"})
  compadd "$projects[@]"
}
compdef _openit_complete openit
```

---

## 🛠️ How it works

- `openit.sh` reads `config.env`, lists `PROJECTS_DIR`, fuzzy-matches your input, and runs `EDITOR_CMD .` in the matched folder.
- `install.sh` symlinks the script to `/usr/local/bin/openit` and installs Bash completion.

Note: When using the installed command, `config.env` must live next to `/usr/local/bin/openit` (i.e., `/usr/local/bin/config.env`).

---

## 🪄 Troubleshooting

- **“command not found: openit”**
  - Re-run `sudo ./install.sh`, then open a new shell.
- **“No config.env found. Run install.sh to configure.”**
  - Create `/usr/local/bin/config.env` as shown in Install → Configure.
- **“No project found matching …”**
  - Check `PROJECTS_DIR` exists and contains folders.
- **Editor not opening**
  - Ensure the editor CLI is on PATH: `cursor --version`, `code --version`, etc.

---

## 🧭 Roadmap

- `fzf` interactive selection (no argument → menu)
- Subcommands: `openit list`, `openit config`
- Register external folders
- Colored output

---

## 🧑‍💻 Contributing

```bash
git clone https://github.com/aqrab/openit.git
git checkout -b feature/my-feature
# make your edits
git commit -m "Add my feature"
git push origin feature/my-feature
```

Then open a PR on GitHub.

---

## 🪪 License

MIT License © 2025 [aqrab](https://github.com/aqrab)

---

## 💬 Why `openit`?

Because you don’t need to remember paths to be productive.
Just name your project — and openit.

```
