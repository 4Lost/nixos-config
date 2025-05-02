mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')

if [[ "$mute" == "yes" ]]; then
  echo "speakerOff" # muted icon
else
  echo "speakerOn" # high volume
fi
