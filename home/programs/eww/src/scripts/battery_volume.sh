bat=$(cat /sys/class/power_supply/BAT0/capacity)

if [ ! -d "/sys/class/power_supply/BAT0" ]; then
  bat="100"
fi

echo "$bat"
