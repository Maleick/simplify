#!/bin/sh

set -eu

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo 'git repo missing'; exit 1; }
git remote get-url origin >/dev/null 2>&1 || { echo 'origin missing'; exit 1; }
gh repo view >/dev/null 2>&1 || { echo 'github repo missing'; exit 1; }

printf 'publication ok\n'
