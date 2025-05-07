mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')

# /-- Mic -->

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q "yes"; then
  eww update micClass="micOff"
  eww update micIcon="󰍭"
else
  eww update micClass="micOn"
  eww update micIcon="󰍬"
fi

# /-- Speaker -->

if [[ "$mute" == "yes" ]]; then
  eww update speakerClass="speakerOff"
  eww update speakerIcon=""
elif [[ "$volume" -le 100 ]]; then
  eww update speakerClass="speakerOn"
  eww update speakerIcon=""
else
  eww update speakerClass="speakerOn"
  eww update speakerIcon=""
fi

echo "$volume"
