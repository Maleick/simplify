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

if ! grep -q '^## When To Use$' skills/simplify-brainstorm/SKILL.md; then
  printf 'simplify-brainstorm missing When To Use section\n'
  exit 1
fi

if ! grep -q '^## Core Rules$' skills/simplify-brainstorm/SKILL.md; then
  printf 'simplify-brainstorm missing Core Rules section\n'
  exit 1
fi

if ! grep -q '^## Boundaries$' skills/simplify-brainstorm/SKILL.md; then
  printf 'simplify-brainstorm missing Boundaries section\n'
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

if ! grep -q '^## Rules$' agents/code-simplifier.md; then
  printf 'code-simplifier missing Rules section\n'
  exit 1
fi

if ! grep -q '^## Process$' agents/code-simplifier.md; then
  printf 'code-simplifier missing Process section\n'
  exit 1
fi

printf 'brainstorm skill and simplifier agent ok\n'
