#!/usr/bin/env bash
read -r json
project=$(echo "$json" | jq -r '.project // empty')
[[ -n "$project" ]] && parent=$(echo "$project" | cut -d. -f1 || echo "$project") || parent=""
echo "$json" | jq -c --arg p "$parent" '.parentName = $p'
