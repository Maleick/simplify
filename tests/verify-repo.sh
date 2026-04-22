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

check_contains README.md 'OpenCode-first' 'README OpenCode-first text missing'
check_contains docs/opencode-compatibility.md '~/.config/opencode/skills' 'OpenCode install path missing'
check_contains docs/claude-compatibility.md 'no Claude plugin manifest' 'Claude packaging statement missing'
check_contains docs/integration-autoship.md 'autoship' 'AutoShip integration text missing'
check_contains docs/integration-autoship.md 'issue/PR pipeline' 'AutoShip boundary missing'
check_contains docs/integration-autoresearch.md 'autoresearch' 'AutoResearch integration text missing'
check_contains docs/integration-autoresearch.md 'deep structured research' 'AutoResearch boundary missing'

printf 'documentation ok\n'
