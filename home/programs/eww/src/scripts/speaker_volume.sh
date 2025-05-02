volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')
half_volume=$((volume / 2))

echo "$half_volume"
