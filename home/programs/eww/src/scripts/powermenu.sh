WINDOW_NAME="power"
if eww windows | grep -q "$WINDOW_NAME"; then
  eww close "$WINDOW_NAME"
else
  eww open "$WINDOW_NAME"
fi
