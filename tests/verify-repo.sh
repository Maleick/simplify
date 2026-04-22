#!/bin/sh

set -eu

for path in \
  README.md \
  LICENSE \
  .gitignore \
  skills/simplify/SKILL.md \
  skills/simplify-review/SKILL.md \
  agents/.gitkeep \
  docs/opencode-compatibility.md \
  docs/claude-compatibility.md \
  docs/integration-autoship.md \
  docs/integration-autoresearch.md
do
  if [ ! -e "$path" ]; then
    printf 'missing: %s\n' "$path"
    exit 1
  fi
done

if ! grep -q '^name: simplify$' skills/simplify/SKILL.md; then
  printf 'simplify name missing\n'
  exit 1
fi

if ! grep -q 'autoship' skills/simplify/SKILL.md; then
  printf 'autoship handoff missing\n'
  exit 1
fi

if ! grep -q '^- Use `autoship-\*` when the request is really about issue execution, branch flow, PR flow, or repository orchestration\.$' skills/simplify/SKILL.md; then
  printf 'specific autoship handoff missing\n'
  exit 1
fi

if ! grep -q '^name: simplify-review$' skills/simplify-review/SKILL.md; then
  printf 'simplify-review name missing\n'
  exit 1
fi

if ! grep -q 'findings-first' skills/simplify-review/SKILL.md; then
  printf 'findings-first review missing\n'
  exit 1
fi

if ! grep -q '^- Lead with findings-first output\.$' skills/simplify-review/SKILL.md; then
  printf 'specific findings-first review missing\n'
  exit 1
fi

printf 'router and review skills ok\n'
