#!/bin/sh

set -eu

check_contains() {
  file=$1
  pattern=$2
  message=$3

  if ! grep -q "$pattern" "$file"; then
    printf '%s\n' "$message"
    exit 1
  fi
}

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

check_contains skills/simplify-brainstorm/SKILL.md '^name: simplify-brainstorm$' 'simplify-brainstorm name missing'
check_contains skills/simplify-brainstorm/SKILL.md 'autoresearch' 'autoresearch handoff missing'
check_contains skills/simplify-brainstorm/SKILL.md '^## When To Use$' 'simplify-brainstorm missing When To Use section'
check_contains skills/simplify-brainstorm/SKILL.md '^## Core Rules$' 'simplify-brainstorm missing Core Rules section'
check_contains skills/simplify-brainstorm/SKILL.md '^## Boundaries$' 'simplify-brainstorm missing Boundaries section'
check_contains agents/code-simplifier.md '^name: code-simplifier$' 'code-simplifier name missing'
check_contains agents/code-simplifier.md 'preserve functionality' 'preserve functionality missing'
check_contains agents/code-simplifier.md '^## Rules$' 'code-simplifier missing Rules section'
check_contains agents/code-simplifier.md '^## Process$' 'code-simplifier missing Process section'

printf 'brainstorm skill and simplifier agent ok\n'
