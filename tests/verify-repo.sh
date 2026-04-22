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
  agents/code-simplifier.md \
  agents/reviewer.md \
  agents/brainstormer.md
do
  if [ ! -e "$path" ]; then
    printf 'missing: %s\n' "$path"
    exit 1
  fi
done

check_contains agents/reviewer.md '^name: reviewer$' 'reviewer name missing'
check_contains agents/reviewer.md 'findings-first' 'reviewer findings-first missing'
check_contains agents/brainstormer.md '^name: brainstormer$' 'brainstormer name missing'
check_contains agents/brainstormer.md '2-3 viable approaches' 'brainstormer options missing'

printf 'reviewer and brainstormer agents ok\n'
