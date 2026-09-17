---
name: code-changes
description: 'Guidelines for writing new source code'
license: MIT
---

# Code Generation Guidelines

## Overview

Follow these guidelines when writing new code.

## Rules
- Preserve unrelated user changes in a dirty worktree.
- Preserve existing structure, formatting, and conventions.
- Prefer minimal diffs; avoid rewriting entire files when a small change is sufficient.
- Do not introduce optimizations or refactors unless they are required to correctly implement the request.
- Code should be easily readable, and have descriptive names.
- Opt for explict variable names, instead of succinct ones.
  - e.g. "TTL_SECONDS", not "TTL".
- Favor explicit behavior over clever tricks.

### Comments
- Do not add docstrings for functions less than 20 lines long
- Add concise comments only when the code itself is not sufficiently self-explanatory.
- Put comments on their own lines in code, above the source line.

### Tests
- DO NOT generate tests or edit tests unless explicitly asked.
- DO NOT run tests unless explicitly asked.

### Python
- Always format a docstring with three double quotes ("""), and put a new line after the first set of three double quotes, and before the last set.  Do not put a blank line after the end of the doc string and before the code. For example:
    ```python
    def f(x):
        """
        This is a docstring.
        """
        return x+1
    ```