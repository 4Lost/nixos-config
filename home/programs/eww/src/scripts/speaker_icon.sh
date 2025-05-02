mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')

if [[ "$mute" == "yes" ]]; then
  echo "" # muted icon
elif [[ "$volume" -le 100 ]]; then
  echo "" # low volume
else
  echo "" # high volume
fi
