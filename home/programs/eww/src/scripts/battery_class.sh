bat=$(cat /sys/class/power_supply/BAT0/capacity)
stat=$(cat /sys/class/power_supply/AC/online)

class="batteryFull"

if [[ $stat == 1 ]]; then
  class="batteryCharging"
elif [[ $bat -le 10 ]]; then
  class="batteryEmpty"
elif [[ $bat -le 80 ]]; then
  class="batteryHalf"
fi

echo "$class"
