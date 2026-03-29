TEMP_FILE="/tmp/river-eww-status"

# Read last two lines (layout/tags and focused window)
json=$(tail -n2 "$TEMP_FILE" | head -n1)
win_json=$(tail -n1 "$TEMP_FILE")

# Extract layout
layout=$(echo "$json" | jq -r '.layout // ""')

# Extract focused window title
windows=$(echo "$win_json" | jq -r '.title // ""')

# Extract focused tags as array
mapfile -t focused_tags < <(echo "$json" | jq -r '.tags.BOE // [] | .[]')

# Update workspace classes
for i in $(seq 1 9); do
  class="ws-empty"
  for tag in "${focused_tags[@]}"; do
    if [[ "$tag" == "$i" ]]; then
      class="ws-current"
      break
    fi
  done
  eww update ws$i="$class"
done

# Update layout
eww update layouts="$layout"

# Output focused window for widget
echo "$windows"
