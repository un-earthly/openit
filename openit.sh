#!/bin/bash
# openit.sh - Generic project opener for any directory + app

# Load config if exists
CONFIG_FILE="$(dirname "$0")/config.env"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "No config.env found. Run install.sh to configure."
    exit 1
fi

# Default values if not defined in config
PROJECTS_DIR="${PROJECTS_DIR:-~/Desktop/projects}"
EDITOR_CMD="${EDITOR_CMD:-windsurf}"

if [ -z "$1" ]; then
  echo "Usage: openit <project-name>"
  echo "Available projects:"
  ls "$PROJECTS_DIR"
  exit 1
fi

# Fuzzy match
MATCH=$(ls "$PROJECTS_DIR" | grep -i "$1" | head -n 1)

if [ -z "$MATCH" ]; then
  echo "No project found matching '$1'"
  exit 1
fi

echo "Opening '$MATCH' with $EDITOR_CMD..."
cd "$PROJECTS_DIR/$MATCH" && $EDITOR_CMD .
