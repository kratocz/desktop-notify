#!/usr/bin/env bash
# Fired by Claude Code Stop hook — notifies user that Claude is waiting for a response.

PROJECT=$(basename "$PWD")
TITLE="Claude Code – $PROJECT"
MSG="Waiting for your response"

if [[ "$OSTYPE" == "darwin"* ]]; then
  osascript -e "display notification \"$MSG\" with title \"$TITLE\"" 2>/dev/null
elif command -v notify-send &>/dev/null; then
  notify-send "$TITLE" "$MSG" -u normal 2>/dev/null
fi
