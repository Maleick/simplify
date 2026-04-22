#!/bin/sh

set -eu

for path in \
  README.md \
  LICENSE \
  .gitignore \
  skills/.gitkeep \
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

printf 'scaffold ok\n'
