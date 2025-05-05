hostname=$(hostname)

if [[ "$hostname" == "eliasLaptop" ]]; then
  eww open bar --screen eDP-1
  # You can put other commands specific to this hostname
elif [[ "$hostname" == "eliasDesktop" ]]; then
  echo "This is another PC!"
  # Add commands for the second PC
else
  echo "This is an unknown PC."
  # Add commands for unknown hosts
fi
