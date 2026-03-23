#!/usr/bin/env bash
# Fired by Claude Code PermissionRequest hook — notifies user that Claude needs tool approval.
# Reads JSON from stdin: { "tool_name": "Bash", "tool_input": { "command": "..." } }

DATA=$(cat)
TOOL=$(echo "$DATA" | jq -r '.tool_name // "?"')
DETAIL=$(echo "$DATA" | jq -r '(.tool_input.command // .tool_input.file_path // "") | .[0:80]')
PROJECT=$(basename "$PWD")
TITLE="Claude Code – $PROJECT"
MSG="Approval: $TOOL${DETAIL:+: $DETAIL}"

if [[ "$OSTYPE" == "darwin"* ]]; then
  osascript -e "display notification \"$MSG\" with title \"$TITLE\"" 2>/dev/null
elif command -v notify-send &>/dev/null; then
  notify-send "$TITLE" "$MSG" -u critical 2>/dev/null
fi
