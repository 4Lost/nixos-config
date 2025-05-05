WINDOW_NAME="power"

echo "Power button pressed" >>/tmp/acpi_log.txt

# Check if the window is already open
if eww active-windows | grep -q "$WINDOW_NAME"; then
  eww close "$WINDOW_NAME"
else
  eww open "$WINDOW_NAME" --screen "$(wlr-randr | grep -oP '^\S+' | head -n 1)"
fi
