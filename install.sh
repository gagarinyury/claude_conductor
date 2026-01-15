#!/bin/bash

# Determine the directory where this script is located
CONDUCTOR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Target directory (defaults to current working directory)
TARGET_DIR="${1:-.}"

echo "🚀 Installing Conductor for Claude Code to: $TARGET_DIR"

# 1. Install Commands
echo "📦 Installing commands..."
COMMANDS_DIR="$TARGET_DIR/.claude/commands"
mkdir -p "$COMMANDS_DIR"
cp "$CONDUCTOR_DIR/.claude/commands/"*.md "$COMMANDS_DIR/"
echo "   - Installed /setup, /new-track, /implement"

# 2. Install Templates
echo "📄 Installing templates..."
cp -r "$CONDUCTOR_DIR/templates" "$TARGET_DIR/"
echo "   - Copied templates/"

# 3. Configure CLAUDE.md
echo "⚙️  Configuring CLAUDE.md..."
TARGET_CLAUDE_MD="$TARGET_DIR/.claude/CLAUDE.md"
mkdir -p "$(dirname "$TARGET_CLAUDE_MD")"

if [ -f "$TARGET_CLAUDE_MD" ]; then
    # Check if Conductor is already installed to avoid duplicates
    if grep -q "Conductor for Claude Code" "$TARGET_CLAUDE_MD"; then
        echo "   - Conductor configuration already present in CLAUDE.md (skipping append)"
    else
        echo "" >> "$TARGET_CLAUDE_MD"
        echo "---" >> "$TARGET_CLAUDE_MD"
        echo "" >> "$TARGET_CLAUDE_MD"
        cat "$CONDUCTOR_DIR/CLAUDE.md" >> "$TARGET_CLAUDE_MD"
        echo "   - Appended configuration to existing CLAUDE.md"
    fi
else
    cat "$CONDUCTOR_DIR/CLAUDE.md" > "$TARGET_CLAUDE_MD"
    echo "   - Created new CLAUDE.md"
fi

echo "✅ Installation complete!"
echo "--------------------------------------------------------"
echo "Try running '/setup' in Claude Code to initialize your project."
