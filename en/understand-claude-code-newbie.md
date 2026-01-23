[ **English** ](understand-claude-code-newbie.md) | [ **Tiếng Việt** ](../vn/understand-claude-code-newbie.md)

# Complete Guide to Claude Code V2

> **Note:** This is the V2 version of the guide, widely welcomed by the community. Thanks to u/headset38, u/tulensrma, u/jcheroske for your feedback. This version adds **Part 7: Skills & Hooks**, including an enforcement layer to ensure Claude strictly follows rules.

### What's New in V2:
- **Part 7: Skills & Hooks** — Deterministic enforcement instead of suggestions.
- [GitHub repo](https://github.com/TheDecipherist/claude-code-mastery) with templates, hooks, and skills.

## TL;DR
Your global `~/.claude/CLAUDE.md` file acts as a **security gatekeeper** (preventing secret leaks) AND a **project scaffolding blueprint** (ensuring consistency).

### Key Components
- **MCP Servers** — Expands Claude's capabilities.
- **Context7** — Access live documentation.
- **Custom Commands** & **Agents** — Automate repetitive processes.
- **Hooks** — Enforce rules deterministically where `CLAUDE.md` might fail.
- **Skills** — Encapsulate reusable expertise.

### ⚠️ Important Note
Mixing multiple topics in one chat causes a **39% performance drop**. Keep chats focused on a single task.

---

## Part 1: Global CLAUDE.md as a Security Gatekeeper

### The Memory Hierarchy
1. **Enterprise**: `/etc/claude-code/CLAUDE.md` - Org-wide policies.
2. **Global User**: `~/.claude/CLAUDE.md` - YOUR standards for ALL projects.
3. **Project**: `./CLAUDE.md` - Team guidelines.
4. **Project Local**: `./CLAUDE.local.md` - Personal overrides.

### Gatekeeper Rules (Add to Global CLAUDE.md)
```markdown
## NEVER EVER DO
These rules are ABSOLUTE:
### NEVER Publish Sensitive Data
- NEVER publish passwords, API keys, tokens.
### NEVER Commit .env Files
- ALWAYS verify .env is in .gitignore.
```

---

## Part 2: Global Rules for Scaffolding

When creating a new project, Claude should automatically apply these rules defined in your Global CLAUDE.md:

```markdown
## New Project Setup
When creating ANY new project, ALWAYS do:
1. Create .env and .env.example
2. Create .gitignore (include .env, node_modules/)
3. Create README.md
4. Create standard directory structure (src/, tests/, docs/)
```

---

## Part 3: MCP Servers

MCP (Model Context Protocol) allows Claude to interact with external tools.

**Essential MCP Servers:**
- **Context7**: Live docs (`claude mcp add context7 -- npx -y @anthropic-ai/context7-mcp`)
- **Playwright**: Browser testing
- **GitHub**: Repo management
- **Filesystem**: Extended file access

---

## Part 4: Context7 — Live Documentation

Claude's training data has a cutoff. Context7 fetches **live documentation** for up-to-date APIs.

Usage: "Using context7, show me how to use the new Next.js 15 cache API"

---

## Part 5: Custom Commands and Sub-Agents

Slash commands automate workflows. Store them in `.claude/commands/`.

**Example:** `/fix-types`
Description: Run TSC and fix errors.

**Sub-Agents:** Run in an **isolated context window** to avoid polluting your main chat. Use them for research.

---

## Part 6: Why Single-Purpose Chats Matter

**"One Task, One Chat"**

Research shows performance drops significantly when context drifts.
- **New Feature?** New Chat.
- **Bug Fix?** `/clear` or New Chat.
- **Research?** Spawn a sub-agent.

**Use `/clear` frequently.**

---

## Part 7: Skills & Hooks — Enforcement over Suggestion

**Hooks** are shell commands that run at specific lifecycle events. They are **deterministic**.

**Example:** `PreToolUse` hook to block access to `.env` files. If Claude tries to read `.env`, the hook exits with code 2, blocking the action.

**Skills**: Markdown files in `.claude/skills/` that teach Claude how to do a specific task (e.g., `commit-messages`). They are loaded only when needed (Progressive Disclosure).

### Defense in Depth
1. **CLAUDE.md rules**: Suggestions.
2. **PreToolUse hooks**: **Enforcement**.
3. **settings.json deny list**: Enforcement.
4. **.gitignore**: Prevention.

---

## Quick Reference

| Component | Location | Purpose |
|:---|:---|:---|
| **Global CLAUDE.md** | `~/.claude/CLAUDE.md` | Security + Scaffolding |
| **Project CLAUDE.md** | `./CLAUDE.md` | Architecture + Project Commands |
| **Hooks** | `~/.claude/settings.json` | Deterministic Enforcement |
| **/clear** | Command | Reset Context |

---

> **Resources**:
> [GitHub Repo with Templates](https://github.com/TheDecipherist/claude-code-mastery)
