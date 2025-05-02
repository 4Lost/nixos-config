if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q "yes"; then
  echo "micOff"
else
  echo "micOn"
fi
