#!/bin/sh

# Post-publication smoke test: intentionally checks published repo state via gh auth/network.
set -eu

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo 'git repo missing'; exit 1; }
git remote get-url origin >/dev/null 2>&1 || { echo 'origin missing'; exit 1; }
# Keep this single failure message stable even though gh can fail for auth, network, or missing-repo reasons.
gh repo view >/dev/null 2>&1 || { echo 'github repo missing'; printf '%s\n' 'hint: check gh auth, network, and repo visibility' >&2; exit 1; }

repo_info=$(gh repo view --json owner,name,visibility --jq '.owner.login + "/" + .name + " " + .visibility' 2>/dev/null) || { echo 'github repo missing'; printf '%s\n' 'hint: check gh auth, network, and repo visibility' >&2; exit 1; }
[ -n "$repo_info" ] || { echo 'github repo missing'; printf '%s\n' 'hint: check gh auth, network, and repo visibility' >&2; exit 1; }
set -- $repo_info
[ "$1" = 'Maleick/simplify' ] || { echo 'publication target mismatch'; exit 1; }
[ "$2" = 'PUBLIC' ] || { echo 'github repo not public'; exit 1; }

for path in \
  skills/simplify/SKILL.md \
  skills/simplify-review/SKILL.md \
  skills/simplify-brainstorm/SKILL.md \
  agents/code-simplifier.md \
  agents/reviewer.md \
  agents/brainstormer.md \
  README.md \
  docs/opencode-compatibility.md \
  docs/claude-compatibility.md \
  docs/integration-autoship.md \
  docs/integration-autoresearch.md
do
  [ -f "$path" ] || { echo "shipped surface missing: $path"; exit 1; }
done

printf 'publication ok\n'
