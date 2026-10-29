#!/bin/zsh

cd "${0:A:h:h:h}"
node tools/dialogue_editor/server.js &
editor_pid=$!
trap 'kill "$editor_pid"' EXIT

until curl -fsS http://127.0.0.1:4173 >/dev/null 2>&1; do
  sleep 0.1
done

open "http://127.0.0.1:4173"
wait "$editor_pid"
