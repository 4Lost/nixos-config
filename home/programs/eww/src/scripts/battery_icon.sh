bat=$(cat /sys/class/power_supply/BAT0/capacity)
stat=$(cat /sys/class/power_supply/AC/online)

icon=""

if [[ $stat == 1 ]]; then
  icon=""
elif [[ $bat -le 10 ]]; then
  icon=""
elif [[ $bat -le 50 ]]; then
  icon=""
elif [[ $bat -le 80 ]]; then
  icon=""
fi

echo "$icon"
