mute=$(wpctl get-volume @DEFAULT_SINK@ | grep -o "muted")
volume=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print int($1*100)}')

# /-- Mic -->
mic_mute=$(wpctl get-volume @DEFAULT_SOURCE@ | grep -o "muted")
if [[ "$mic_mute" == "muted" ]]; then
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
