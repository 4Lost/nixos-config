WINDOW="power"
DISPLAY=""

# Check if the window is already open
if eww active-windows | grep -q "$WINDOW"; then
  eww close "$WINDOW"
  exit 0
fi

# Determin screen
if [[ "$(hostname)" == "eliasLaptop" ]]; then
  DISPLAY="eDP-1"
elif [[ "$(hostname)" == "eliasDesktop" ]]; then
  DISPLAY="DVI-D-1"
fi

echo "$DISPLAY"

eww open "$WINDOW" --screen "$DISPLAY"
