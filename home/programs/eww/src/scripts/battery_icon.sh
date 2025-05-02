bat=$(cat /sys/class/power_supply/BAT0/capacity)
stat=$(cat /sys/class/power_supply/BAT0/status)

icon=""

if [[ $stat == "Charging" ]]; then
  icon=""
elif [[ $bat -le 10 ]]; then
  icon=""
elif [[ $bat -le 50 ]]; then
  icon=""
elif [[ $bat -le 80 ]]; then
  icon=""
fi

echo "$icon"
