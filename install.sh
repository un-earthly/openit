#!/bin/bash
# install.sh - Install openit globally

TARGET=/usr/local/bin/openit
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

sudo ln -sf "$SCRIPT_DIR/openit.sh" "$TARGET"
echo "Installed openit -> $TARGET"

# Bash completion setup
COMPLETION_FILE=/etc/bash_completion.d/openit

sudo bash -c "cat > $COMPLETION_FILE" << 'EOF'
_openit_complete() {
    local cur=\${COMP_WORDS[COMP_CWORD]}
    local projects_dir=\${PROJECTS_DIR:-~/Desktop/projects}
    [ -f "$(dirname $(which openit))/../config.env" ] && source "$(dirname $(which openit))/../config.env"
    local projects=\$(ls "\$projects_dir" 2>/dev/null)
    COMPREPLY=( \$(compgen -W "\$projects" -- "\$cur") )
}
complete -F _openit_complete openit
EOF

echo "Autocomplete installed."

