#!/usr/bin/env bash
# Runs the single test N times and counts Firefox page crashes.
runs=${1:-10}
shift
crashes=0
for i in $(seq 1 "$runs"); do
  if npx vitest run "$@" 2>&1 | grep -q 'page crashed'; then
    crashes=$((crashes + 1))
    echo "run $i: crashed"
  else
    echo "run $i: ok"
  fi
done
echo "$crashes/$runs runs crashed"
