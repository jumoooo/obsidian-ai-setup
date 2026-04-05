# 🧠 Obsidian AI Auto-Setup

> **Set up your Obsidian vault in minutes — just talk to an AI agent.**
>
> Works with **Cursor** and **Claude Code**. No manual configuration needed.

---

## ✨ What is this?

This is a portable AI agent skill pack that automatically sets up your Obsidian vault with:

- ✅ **Plugin installation** — picks the right plugins for your workflow
- ✅ **Theme setup** — applies your preferred visual style
- ✅ **Config restoration** — ensures all settings files are in place
- ✅ **Interactive selection** — asks what you want before touching anything

The agent **talks to you first**, explains everything in plain language, and only installs what you actually need.

---

## 📋 Prerequisites

| Requirement | Details |
|---|---|
| Obsidian | v1.8 or later (Desktop) |
| Obsidian CLI | v1.12+ — enable in Settings → General → CLI |
| AI Agent | Cursor (with Agent mode) **or** Claude Code |
| Git | For cloning this repo |

> **How to enable the CLI:**
> Open Obsidian → Settings → General → scroll down → "Command line interface" → toggle ON → follow the prompt to add it to PATH.
> Verify with: `obsidian version`

---

## 🚀 Quick Start

### Step 1 — Copy files to your vault

```bash
# Clone this repo
git clone https://github.com/your-username/obsidian_ai_setup.git

# Copy the setup files to your vault root
cp -r obsidian_ai_setup/.cursor   /path/to/your/vault/
cp -r obsidian_ai_setup/.claude   /path/to/your/vault/
```

Or just drag the `.cursor/` and `.claude/` folders into your vault in File Explorer.

### Step 2 — Configure your vault snapshot (optional)

Copy and edit the example config:

```bash
cp .cursor/skills/obsidian-vault-setup/vault-snapshot.example.md \
   .cursor/skills/obsidian-vault-setup/vault-snapshot.md
```

Edit `vault-snapshot.md` to match your vault's name, folder structure, and preferred settings.
If you skip this step, the agent will use sensible defaults.

### Step 3 — Open your vault in Cursor or Claude Code

Make sure Obsidian is **running** with your vault open.

### Step 4 — Run the setup

**In Cursor:**
```
"Set up my Obsidian vault"
"옵시디언 셋업해줘"
"vault 초기화해줘"
```
The `obsidian-vault-setup` skill will automatically activate.

**In Claude Code:**
```
/project:vault-setup
```

---

## 🎯 How it works

The agent follows a guided, interactive flow:

```
1. Scan     → Checks what's already installed (skips it)
2. Brief    → Explains what will happen in plain language
3. Theme    → Asks which visual style you prefer
4. Choose   → Shows plugin category menu (pick what you need)
5. Confirm  → Shows final plan before doing anything
6. Install  → Runs only the selected installations
7. Report   → Tells you exactly what happened
```

**Nothing happens without your confirmation.**

---

## 🔌 Plugin Categories

Choose only the categories you need. The agent explains each one in simple terms.

| Category | Plugins | Best For |
|---|---|---|
| 🟢 **Essential** (always installed) | Templater, Tag Wrangler, Recent Files, Settings Search, Plugin Update Tracker | Everyone |
| 📅 **Time Management** | Calendar, Periodic Notes | Daily journals, weekly/monthly planning |
| ✏️ **Editing Tools** | Editing Toolbar, Outliner, Emoji Shortcodes, Slash Commander, Commander | Power writers who want shortcuts & buttons |
| 📋 **Note Styling** | Admonition, Pretty Properties, QuickAdd | Beautiful callout boxes, styled metadata |
| 🔧 **File Management** | File Cleaner Redux, Remember Cursor Position, View Mode by Frontmatter, Pinned Notes | Automatic tidying, position memory |
| 🌐 **External** | Slurp, Importer | Web clipping, importing from Notion/Evernote |
| 🤖 **AI / Developer** | BRAT, Claudian | AI integration, beta plugin testing |

---

## 🏗️ How the Agent Makes Decisions

```
Has plugin → Skip
Missing plugin + you selected it → Install
Missing plugin + you didn't select it → Leave alone
Config file exists → Leave alone
Config file missing → Restore from defaults
Error during install → Continue rest, report at end
You say cancel → Stop immediately
```

---

## 📁 File Structure

```
obsidian_ai_setup/                      ← clone this repo
├── README.md
├── .gitignore
├── .cursor/
│   ├── rules/
│   │   └── obsidian-vault.mdc          ← always-on vault rules (Cursor)
│   └── skills/
│       └── obsidian-vault-setup/       ← the portable skill pack
│           ├── SKILL.md                ← Cursor entry point
│           ├── SETUP-GUIDE.md          ← core logic (AI-agnostic)
│           ├── plugin-catalog.md       ← plugin list & descriptions
│           ├── vault-snapshot.example.md ← template: copy & edit this
│           └── scripts/
│               ├── phase1-config.ps1   ← restore config files (Windows)
│               └── phase2-cli.sh       ← install plugins via CLI
└── .claude/
    └── commands/
        └── vault-setup.md              ← Claude Code entry point
```

### Copy to your vault → gets this layout

```
your-vault/
├── .cursor/         ← copy from this repo
│   ├── rules/
│   └── skills/
│       └── obsidian-vault-setup/
│           └── vault-snapshot.md   ← your personal config (from example)
├── .claude/         ← copy from this repo
│   └── commands/
└── ... your notes ...
```

---

## ⚙️ Customizing for Your Vault

Edit `vault-snapshot.md` (copied from `vault-snapshot.example.md`) to define:

| Section | What to change |
|---|---|
| Vault name | Your actual vault name |
| Folder structure | Your PARA / ZK layout |
| Plugin list | Which plugins to include per category |
| App settings | Default view mode, new file location, etc. |
| Hotkeys | Your preferred keyboard shortcuts |

This file is the **single source of truth** for your vault's target configuration.

---

## 🔄 Using with Multiple Vaults

Each vault gets its own `vault-snapshot.md`. Everything else stays the same:

```bash
# Vault A — work notes
cp vault-snapshot.example.md work-vault/.cursor/skills/obsidian-vault-setup/vault-snapshot.md
# edit to match work vault settings

# Vault B — personal notes
cp vault-snapshot.example.md personal-vault/.cursor/skills/obsidian-vault-setup/vault-snapshot.md
# edit to match personal vault settings
```

---

## 🤖 AI Agent Compatibility

| Feature | Cursor | Claude Code |
|---|---|---|
| Skill activation | Automatic (keyword detection) | `/project:vault-setup` |
| Multiple choice UI | `AskQuestion` tool | Numbered list |
| Plan confirmation | Plan mode style | Inline confirmation |
| Both work the same? | ✅ Same `SETUP-GUIDE.md` | ✅ Same `SETUP-GUIDE.md` |

---

## 🛠️ Technical Details

### Phase 1 — Config File Restoration
Runs without Obsidian open. Uses PowerShell to write missing `.obsidian/*.json` files. Skips files that already exist.

### Phase 2 — Plugin & Theme Installation
Requires Obsidian running. Uses `obsidian plugin:install`, `obsidian theme:install`. Each plugin installs independently — one failure doesn't stop the rest.

### Minimum Action Principle
The agent always does the least amount of work necessary. Already-installed plugins are skipped. Already-applied themes are skipped. Existing config files are not overwritten.

---

## 📝 Phase 1 Script (Windows)

```bash
# Run manually if needed
powershell -ExecutionPolicy Bypass \
  -File ".cursor/skills/obsidian-vault-setup/scripts/phase1-config.ps1" \
  -VaultPath "path/to/your/vault"
```

## 📝 Phase 2 Script (CLI)

```bash
# Install specific categories
.cursor/skills/obsidian-vault-setup/scripts/phase2-cli.sh \
  --essential --cat-a --cat-b --theme-things

# Install everything
.cursor/skills/obsidian-vault-setup/scripts/phase2-cli.sh --all
```

---

## 🌏 Language

| File | Language |
|---|---|
| README.md | English |
| SETUP-GUIDE.md | Korean (AI-facing instructions) |
| plugin-catalog.md | Korean (with English plugin names) |
| Scripts | Korean comments, English code |

Korean-language version of this README: see [README.ko.md](README.ko.md) _(coming soon)_

---

## 🤝 Contributing

PRs welcome! Especially for:

- Adding new plugin categories
- macOS / Linux support for Phase 1 script
- More theme options in the catalog
- Translation improvements

---

## 📄 License

MIT — free to use, fork, and share.
