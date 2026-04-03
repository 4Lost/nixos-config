TEMP_FILE="/tmp/river-eww-status"

while true; do
  ristate -t >"$TEMP_FILE.tmp"
  ristate -w >>"$TEMP_FILE.tmp"
  mv "$TEMP_FILE.tmp" "$TEMP_FILE"
  sleep 1
done
