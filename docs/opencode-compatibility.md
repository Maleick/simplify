# OpenCode Compatibility

This repository is designed for OpenCode-first use.

Link or copy skill directories into `~/.config/opencode/skills/`.

Example:

```sh
ln -s "$PWD/skills/simplify" ~/.config/opencode/skills/simplify
ln -s "$PWD/skills/simplify-review" ~/.config/opencode/skills/simplify-review
ln -s "$PWD/skills/simplify-brainstorm" ~/.config/opencode/skills/simplify-brainstorm
```

Repo-owned agent markdown files are portable prompt assets and can be adapted into local custom agents as needed.

For OpenCode project-local discovery, this repository also ships `agent/` adapters:

- `agent/code-simplifier.md`
- `agent/simplify-reviewer.md`
- `agent/simplify-brainstormer.md`

`simplify-reviewer` is namespaced deliberately so it does not collide with OpenCode's built-in `reviewer` agent.
