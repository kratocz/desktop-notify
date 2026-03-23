# claude-code-notify

A [Claude Code](https://claude.ai/claude-code) plugin that sends desktop notifications whenever Claude is waiting for your response or needs your approval to run a tool.

Never miss a paused session again — get notified even when you're in another window.

## What it does

| Event | When | Notification example |
|---|---|---|
| `Stop` | Claude finished its response | `Claude Code – myproject` / `Waiting for your response` |
| `PermissionRequest` | Claude needs tool approval | `Claude Code – myproject` / `Approval: Bash: git status` |

Each notification includes the **project name** in the title so you always know which Claude Code session needs attention.

## Requirements

| Platform | Dependencies |
|---|---|
| Linux | `notify-send` (libnotify) + `jq` |
| macOS | `jq` (notifications via built-in `osascript`) |
| Windows | Not supported yet |

### Install dependencies

**Ubuntu / Debian:**
```bash
sudo apt install libnotify-bin jq
```

**Fedora / RHEL:**
```bash
sudo dnf install libnotify jq
```

**macOS:**
```bash
brew install jq
```

## Installation

```
/plugin marketplace add kratocz/claude-code-notify
/plugin install claude-code-notify@kratocz
```

## How it works

The plugin registers two [Claude Code hook](https://docs.anthropic.com/en/docs/claude-code/hooks) events:

- **`Stop`** — fires when Claude finishes its response and waits for your next message
- **`PermissionRequest`** — fires when Claude needs your approval to execute a tool (Bash command, file write, etc.)

Both hooks run **asynchronously** so they never slow down Claude Code.

The `PermissionRequest` notification includes the tool name and a short preview of the command or file path, so you immediately know what needs your attention.

## Contributing

Issues and PRs are welcome at [github.com/kratocz/claude-code-notify](https://github.com/kratocz/claude-code-notify).

## License

MIT — © [Petr Kratochvíl](https://krato.cz/)
