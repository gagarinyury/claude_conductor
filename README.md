# Conductor for Claude Code

<p align="center">
  <strong>Measure twice, code once.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Claude%20Code-Plugin-blueviolet" alt="Claude Code Plugin">
  <img src="https://img.shields.io/badge/version-1.0.0-green" alt="Version">
  <img src="https://img.shields.io/badge/license-Apache%202.0-blue" alt="License">
  <img src="https://img.shields.io/github/stars/gagarinyury/claude_conductor?style=social" alt="Stars">
</p>

<p align="center">
  <a href="#installation">Installation</a> •
  <a href="#commands">Commands</a> •
  <a href="#usage">Usage</a> •
  <a href="#how-it-works">How it Works</a>
</p>

---

**Conductor** is a Claude Code plugin that enables **Spec-Driven Development**. It transforms Claude into a proactive project manager that follows a strict protocol to specify, plan, and implement software features.

Instead of just writing code, Conductor ensures a consistent, high-quality lifecycle for every task:

```
Context → Spec & Plan → Implement
```

## Installation

### Quick Start (from GitHub)

```bash
# Add the Conductor marketplace
claude plugin marketplace add https://github.com/gagarinyury/claude_conductor

# Install the plugin
claude plugin install conductor@conductor-marketplace
```

### From Official Marketplace

Once accepted into the official marketplace:

```bash
claude plugin install conductor
```

## Commands

| Command | Description |
|---------|-------------|
| `/conductor:setup` | Initialize Conductor in a new project |
| `/conductor:new <description>` | Create a new feature track or bug fix |
| `/conductor:implement [track]` | Execute the tasks defined in a track's plan |
| `/conductor:status` | Display the current progress of all tracks |
| `/conductor:revert` | Revert previous work with git awareness |

## Usage

### 1. Initialize Your Project

```
> /conductor:setup
```

Claude will interview you about:
- **Product** — What are you building? Who is it for?
- **Tech Stack** — Languages, frameworks, databases
- **Workflow** — TDD, commit conventions, code style

Then creates `conductor/` folder with all context files.

### 2. Create a Track

When you want to build a feature or fix a bug:

```
> /conductor:new "Add dark mode to settings"
```

Claude creates:
- `spec.md` — Detailed requirements
- `plan.md` — Step-by-step implementation checklist

### 3. Implement

```
> /conductor:implement
```

Claude follows the plan, checking off tasks as they're completed. It respects your workflow (TDD, commits, etc.).

### 4. Check Progress

```
> /conductor:status
```

Get an overview of all tracks and their completion status.

## How it Works

Conductor creates a `conductor/` directory in your project:

```
my-project/
├── CLAUDE.md                 # Context for Claude (auto-generated)
└── conductor/
    ├── product.md            # Product vision & goals
    ├── tech-stack.md         # Technologies & frameworks
    ├── workflow.md           # Development workflow rules
    ├── product-guidelines.md # Brand voice & style
    ├── tracks.md             # Registry of all tracks
    └── tracks/
        └── feature-dark-mode/
            ├── spec.md       # Requirements
            ├── plan.md       # Implementation checklist
            └── metadata.json
```

### Key Principles

1. **Context First** — Claude reads project files before answering questions
2. **Specs over Chat** — Features start with specs, not code
3. **Plan Compliance** — Claude follows the plan, no surprises
4. **Workflow Adherence** — Respects your TDD, commit, and style rules

## Contributing

We welcome contributions! Please open issues or submit PRs.

## License & Credits

This project is a derivative work based on [Conductor](https://github.com/gemini-cli-extensions/conductor) by the Gemini CLI Extensions team, licensed under Apache License 2.0.

**Changes made in this fork:**
- Migrated from Gemini TOML to Claude Code Markdown format
- Converted to Claude Code plugin format
- Added `conductor:status` and `conductor:revert` commands
- Added skill for automatic context loading
- Setup creates `CLAUDE.md` with Universal File Resolution Protocol

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
