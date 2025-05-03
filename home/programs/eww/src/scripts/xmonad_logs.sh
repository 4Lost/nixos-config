line=$(cat /tmp/xmonad-eww-log)
IFS='|' read -r workspaces layouts windows <<<"$line"
# Workspaces
workspaceArray=($workspaces)
i=0
for ws in "${workspaceArray[@]}"; do
  i=$((i + 1))
  if [[ "$ws" == [\[]* ]]; then
    eww update ws$i="ws-current"
  elif [[ "$ws" == [\(]* ]]; then
    eww update ws$i="ws-visible"
  elif [[ "$ws" == [\{]* ]]; then
    eww update ws$i="ws-hidden"
  else
    eww update ws$i="ws-empty"
  fi
done
# Layouts
eww update layouts="${layouts}"
# Windows
echo "${windows}"
