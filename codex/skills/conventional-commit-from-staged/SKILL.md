---
name: conventional-commit-from-staged
description: Inspect staged git changes and compose a concise Conventional Commit message.
---

# Conventional Commit From Staged Changes

Use this skill when the user asks to stage/create a commit for currently staged git changes.

## Goal

Inspect the staged files in git and produce a commit message using Conventional Commit format.

## Required checks

1. Confirm the repository has staged changes:

git diff --cached --name-status

If there are no staged files, tell the user there are no staged changes and do not invent a commit message.

2. Inspect the staged diff:

git diff --cached --stat  
git diff --cached

Use the diff as the source of truth.

## Commit message format

Use Conventional Commit format:

<type>(optional-scope): <summary>

[optional body]

Allowed types:

- feat: new user-facing functionality
- fix: bug fix
- docs: documentation-only changes
- style: formatting-only changes
- refactor: code change without new behavior or bug fix
- perf: performance improvement
- test: tests added or changed
- build: build system or dependency changes
- ci: CI/CD changes
- chore: maintenance changes
- revert: revert a previous change

## Rules

- Prefer a single-line commit message when the change is simple.
- Use a body only when the staged diff contains multiple meaningful changes or important context.
- Keep the summary under 72 characters when practical.
- Use imperative mood: add, fix, update, remove (not added, fixed, updates).
- Do not mention unstaged or untracked files.
- Do not run git commit unless the user explicitly asks.
- If the best type is ambiguous, choose the most specific reasonable type and briefly explain the choice.

## Output

Return:

1. The recommended commit message.
