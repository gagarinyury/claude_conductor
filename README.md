# Conductor for Claude Code 🤖

**Measure twice, code once.**

> 🚀 **Forked from [Gemini Conductor](https://github.com/gemini-cli-extensions/conductor) and adapted for Claude Code.**

Conductor enables **Context-Driven Development** for Claude Code. It turns Claude into a proactive project manager that follows a strict protocol to specify, plan, and implement software features.

Instead of just writing code, Conductor ensures a consistent, high-quality lifecycle for every task: **Context -> Spec & Plan -> Implement**.

## ✨ Features

- **Plan before you build**: Create specs and plans that guide the agent for new and existing codebases.
- **Maintain context**: Ensure Claude follows style guides, tech stack choices, and product goals.
- **Iterate safely**: Review plans before code is written.
- **Persistent Memory**: Project context is stored in markdown files, not in the chat history.

## 📦 Installation

Since Claude Code doesn't have a package manager for extensions yet, you install Conductor by adding its configuration to your project.

### Method 1: Clone & Link (Recommended)

1.  Clone this repository:
    ```bash
    git clone https://github.com/gagarinyury/claude_conductor.git ~/.claude_conductor
    ```

2.  Copy the prompts and templates to your project:
    ```bash
    cp -r ~/.claude_conductor/prompts ./
    cp -r ~/.claude_conductor/templates ./
    ```

3.  Add the `CLAUDE.md` content to your project's `CLAUDE.md`.

### Method 2: Manual Setup

1.  Copy the `prompts/` folder to your project root.
2.  Copy the `templates/` folder to your project root.
3.  Add the instructions from `CLAUDE.md` to your own `.claude/CLAUDE.md` or project root `CLAUDE.md`.

## 🚀 Usage

Conductor relies on **Slash Commands** defined in `CLAUDE.md` that trigger specialized agent tasks.

### 1. Initialize Project (`/setup`)

Run this command to analyze your codebase (or start fresh) and create the `conductor/` context folder.

```bash
> /setup
```
*Claude will ask you about your product goals, tech stack, and workflow preferences.*

### 2. Create a Track (`/newTrack`)

When you want to build a feature or fix a bug, don't just say "do X". Create a track.

```bash
> /newTrack "Add dark mode to settings"
```
*Claude will interview you to create a detailed `spec.md` and `plan.md` in `conductor/tracks/`.*

### 3. Implement (`/implement`)

Execute the plan. Claude will follow TDD (Test Driven Development) or your custom workflow defined in `conductor/workflow.md`.

```bash
> /implement
```
*Claude works through the checklist in `plan.md`, marking tasks as done and updating the project documentation.*

## 📂 Project Structure

Conductor creates a `conductor/` directory in your project root:

```text
conductor/
├── product.md            # What are we building?
├── tech-stack.md         # What tools are we using?
├── workflow.md           # How do we work? (TDD, commits, etc.)
├── tracks.md             # Registry of all features/bugs
└── tracks/
    └── feature-login/    # Context for a specific feature
        ├── spec.md       # Requirements
        ├── plan.md       # Checklist
        └── metadata.json
```

## 🤝 Contributing

We welcome contributions to adapt more features from the original Gemini Conductor!

## 📜 License

Apache License 2.0 (Inherited from original project)
