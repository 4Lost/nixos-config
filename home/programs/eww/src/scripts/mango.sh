# Update
echo ""
workspaces=(0 0 0 0 0 0 0 0 0)
all_active=1
tags=$(mmsg get all-tags | jq -c '.all_tags[] | [.tags[] | select(.is_active) | .index]')

for i in $(seq 1 9); do
  if jq -n -e --argjson tags "$tags" --argjson i "$i" '$tags | any(. == $i)' >/dev/null; then
    workspaces[$i - 1]=1
  fi
done

for i in $(seq 1 9); do
  if ((workspaces[i - 1] != 1)); then
    all_active=0
    break
  fi
done

if ((all_active)); then
  workspaces=(0 0 0 0 0 0 0 0 0)
  eww update "wsAll=ws-current"
else
  eww update "wsAll=ws-empty"
fi

for i in $(seq 1 9); do
  if ((workspaces[i - 1] == 1)); then
    class="ws-current"
  else
    class="ws-empty"
  fi
  eww update "ws$i=$class"
done

eww update "mango-layout=$(mmsg get all-monitors | jq -r '.monitors[] | select(.active == true) | .layout_symbol')"
eww update "mango-title=$(mmsg get all-monitors | jq -r '.monitors[] | select(.active == true) | .active_client | "\(.appid // "-") [\(.title // "-")]"')"
