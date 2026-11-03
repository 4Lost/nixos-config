HOST_NAME=$(hostname)

if [[ "$HOST_NAME" == "eliasLaptop" ]]; then
  eww open bar --screen eDP-1
elif [[ "$HOST_NAME" == "eliasDesktop" ]]; then
  eww open bar --screen HDMI-A-1
fi
