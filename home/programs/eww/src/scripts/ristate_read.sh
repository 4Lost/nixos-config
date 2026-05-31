layout=$(ristate -l 2>/dev/null | jq -r '.layout // ""')
title=$(ristate -w 2>/dev/null | jq -r '.title // ""')
tags_json=$(ristate -t 2>/dev/null)
views_json=$(ristate -vt 2>/dev/null)

mapfile -t focused_tags < <(
  printf '%s\n' "$views_json" |
    jq -r '.viewstag.Unknown // [] | .[] | tostring'
)

if [ "${#focused_tags[@]}" -eq 0 ]; then
  mapfile -t focused_tags < <(
    printf '%s\n' "$tags_json" |
      jq -r '.tags.Unknown // [] | .[] | tostring'
  )
fi

for i in $(seq 1 9); do
  class="ws-empty"
  for tag in "${focused_tags[@]}"; do
    if [[ "$tag" == "$i" ]]; then
      class="ws-current"
      echo "$tag - current"
      break
    fi
  done
  eww update "ws$i=$class"
done

eww update "layouts=$layout"
echo "$layouts"
eww update "windows=$title"
echo "$windows"

echo "$title"
