#!/bin/sh

set -eu

for path in \
  skills/simplify/SKILL.md \
  skills/simplify-review/SKILL.md \
  skills/simplify-brainstorm/SKILL.md \
  agents/code-simplifier.md
do
  if [ ! -e "$path" ]; then
    printf 'missing: %s\n' "$path"
    exit 1
  fi
done

if ! grep -q '^name: simplify-brainstorm$' skills/simplify-brainstorm/SKILL.md; then
  printf 'simplify-brainstorm name missing\n'
  exit 1
fi

if ! grep -q 'autoresearch' skills/simplify-brainstorm/SKILL.md; then
  printf 'autoresearch handoff missing\n'
  exit 1
fi

if ! grep -q 'Hand off to autoresearch automatically when available\.' skills/simplify-brainstorm/SKILL.md; then
  printf 'autoresearch handoff unclear\n'
  exit 1
fi

if ! grep -q 'deep, structured research' skills/simplify-brainstorm/SKILL.md; then
  printf 'autoresearch trigger missing\n'
  exit 1
fi

if ! grep -q '^name: code-simplifier$' agents/code-simplifier.md; then
  printf 'code-simplifier name missing\n'
  exit 1
fi

if ! grep -q 'preserve functionality' agents/code-simplifier.md; then
  printf 'preserve functionality missing\n'
  exit 1
fi

if ! grep -q '^- Preserve functionality exactly\.$' agents/code-simplifier.md; then
  printf 'preserve functionality rule unclear\n'
  exit 1
fi

printf 'brainstorm skill and simplifier agent ok\n'
