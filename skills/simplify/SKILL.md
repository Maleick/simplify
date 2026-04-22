---
name: simplify
description: Use when the user wants code simplification, a second-opinion review, or brainstorming and you need to route automatically to the right workflow or hand off to autoship or autoresearch when they fit better.
---

# simplify

Route the request to the narrowest correct workflow.

## When To Use

- Simplify recently changed code.
- Review plans or code with findings-first output.
- Brainstorm alternatives before implementation.
- Hand off to autoship for issue or PR orchestration.
- Hand off to autoresearch for deep structured research.

## Routing Rules

- Use `code-simplifier` for direct code simplification work.
- Use `simplify-review` for findings-first review and risk-focused critique.
- Use `simplify-brainstorm` for exploratory option generation before implementation.
- Use `autoship-*` when the request is really about issue execution, branch flow, PR flow, or repository orchestration.
- Use `autoresearch` when the request needs deep structured research rather than implementation or review.

## Red Flags

- Do not re-implement AutoShip.
- Do not re-implement AutoResearch.
- Do not answer as if this skill can store memory, expose MCP tools, or proxy external packages; route to the correct skill or tool instead.
