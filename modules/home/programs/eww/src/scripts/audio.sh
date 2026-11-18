# /-- Get Information -->
sink_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(echo "$sink_info" | awk '{print int($2 * 100)}')
mic_info=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

# /-- Mic -->
if echo "$mic_info" | grep -q "\[MUTED\]"; then
  eww update micClass="micOff"
  eww update micIcon="󰍭"
else
  eww update micClass="micOn"
  eww update micIcon="󰍬"
fi

# /-- Speaker -->

if echo "$sink_info" | grep -q "\[MUTED\]"; then
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
