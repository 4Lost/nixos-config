socat - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/river/status | while read -r line; do
  workspace=$(echo "$line" | jq -r '.workspace')
  layout=$(echo "$line" | jq -r '.layout')
  title=$(echo "$line" | jq -r '.title')
  echo "WS: $workspace | Layout: $layout | $title"
done
