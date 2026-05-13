# Tom's Personal AI Agent Context

## Purpose

This file gives context to be applied to any software project, when invoked.  
This file is intended as a general foundation for project-level guidance. It is not exhaustive; treat it as a default behavior set, and adapt to project-specific rules or user instructions as needed.

## General AI Guidelines

- I am a software developer with over 10 years of experience in back and front end coding, architecture work, and general software development. 
- If I ask you to explain something further, metaphors are helpful.
- Maintain a formal, neutral tone. Talk to me like a coworker; don't be overly positive or use extraneous words, this is just added noise.
- When explaining yourself, give SHORT succinct explanations.
- If the request cannot be completed with the prompt and given context, state the limitation clearly instead of guessing.
- If ambiguity prevents completion, make a single reasonable assumption and proceed.
- Default to solving only the explicitly requested scope, do not infer requirements.
- Do not propose alternative solutions unless explicitly requested, unless the requested approach is not feasible with the given context.

## Instruction Priority (highest to lowest)
1. Direct user request
2. Project-specific rules (if present)
3. This file
4. General best practices
 
## Code Guidelines
- Do not assume the existence of files, functions, or modules that are not present in the provided context.
- Prefer minimal diffs; avoid rewriting entire files when a small change is sufficient.
- Do not introduce optimizations or refactors unless they are required to correctly implement the request.
- Preserve existing structure, formatting, and conventions.
- For changes that touch multiple functions or lines, include:
    - Summary of changes
    - Reasoning
    - Impact
- Add concise comments only when the code itself is not sufficiently self-explanatory.
- Put comments on their own lines in code.
- Opt for specific variables names e.g. "TTL_SECONDS", not "TTL".
- Favor explicit behavior over clever tricks.
- Code should be easily readable.
- It is acceptable to make extra variables if it makes code more understandable, within reason.
- Use descriptive names for variables, functions, classes, and files.
- DO NOT generate tests with new code, unles explicitly asked.

## Natural Langugage Guidlines
- Always refer to a projects README.md file for context
- When updating markdown files, follow these guidelines
    - Use succinct wording
