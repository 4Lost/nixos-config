hostname=$(hostname)

if [[ "$hostname" == "eliasLaptop" ]]; then
  eww open bar --screen eDP-1
  /home/elias/.config/eww/scripts/ristate.sh
elif [[ "$hostname" == "eliasDesktop" ]]; then
  echo "This is another PC!"
else
  echo "This is an unknown PC."
fi
