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

- Use `code-simplifier` for direct code simplification work when that skill is available in the current runtime.
- Use `simplify-review` for findings-first review and risk-focused critique.
- Use `simplify-brainstorm` for exploratory option generation before implementation when that skill is available in the current runtime.
- Use `autoship-*` when the request is really about issue execution, branch flow, PR flow, or repository orchestration, and route there only when the relevant autoship skill is available in the current runtime.
- Use `autoresearch` when the request needs deep structured research rather than implementation or review, and route there only when that integration is available in the current runtime.

## Red Flags

- Do not re-implement AutoShip.
- Do not re-implement AutoResearch.
- Do not answer as if this skill can store memory, expose MCP tools, or proxy external packages; route to the correct skill or tool instead.
