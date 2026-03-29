HOST_NAME=$(hostname)

if [[ "$HOST_NAME" == "eliasLaptop" ]]; then
  eww open bar --screen eDP-1
  /home/elias/.config/eww/scripts/ristate.sh
elif [[ "$HOST_NAME" == "eliasDesktop" ]]; then
  eww open bar --screen DVI-D-1
  /home/elias/.config/eww/scripts/ristate.sh
fi
