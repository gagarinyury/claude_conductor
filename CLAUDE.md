# Conductor for Claude Code

This configuration adapts the **Google Gemini Conductor** methodology for **Claude Code**. It transforms your development process into a structured, spec-driven workflow using persistent context files.

## 🤖 Commands

Use these commands to manage your project lifecycle.

### `/setup` - Initialize Project
**Description:** Scaffolds the project and sets up the Conductor environment.
**Action:**
> Please read `prompts/setup.md` and follow the **SYSTEM DIRECTIVE** inside to initialize the project. Use the `Task` tool to execute this if it involves multiple steps.

### `/newTrack` - Create New Task
**Description:** Plans a new track (feature/bug), generates specs (`spec.md`) and plans (`plan.md`).
**Action:**
> Please read `prompts/newTrack.md` and follow the **SYSTEM DIRECTIVE** inside to create a new track.

### `/implement` - Execute Task
**Description:** Executes the tasks defined in a track's plan using TDD/Workflow rules.
**Action:**
> Please read `prompts/implement.md` and follow the **SYSTEM DIRECTIVE** inside to implement a track.

---

## 📂 Universal File Resolution Protocol

**PROTOCOL: How to locate files.**

To find a file (e.g., "**Product Definition**") within a specific context:

1.  **Identify Index:** Determine the relevant index file:
    -   **Project Context:** `conductor/index.md`
    -   **Track Context:** `conductor/tracks/<track_id>/index.md`

2.  **Standard Default Paths (Project):**
    - **Product Definition**: `conductor/product.md`
    - **Tech Stack**: `conductor/tech-stack.md`
    - **Workflow**: `conductor/workflow.md`
    - **Product Guidelines**: `conductor/product-guidelines.md`
    - **Tracks Registry**: `conductor/tracks.md`
    - **Tracks Directory**: `conductor/tracks/`

3.  **Standard Default Paths (Track):**
    - **Specification**: `conductor/tracks/<track_id>/spec.md`
    - **Implementation Plan**: `conductor/tracks/<track_id>/plan.md`
    - **Metadata**: `conductor/tracks/<track_id>/metadata.json`

---

## ⚠️ Core Rules for Agent

1.  **Context First:** Always check `conductor/` files before answering questions about the project domain or tech stack.
2.  **Specs over Chat:** When asked to build a feature, ALWAYS suggest creating a **Track** (`/newTrack`) first, rather than coding immediately.
3.  **Plan Compliance:** When implementing (`/implement`), NEVER deviate from the `plan.md` without explicit user approval.
4.  **Workflow Adherence:** Follow the rules in `conductor/workflow.md` (e.g. TDD, commit message format) strictly.
