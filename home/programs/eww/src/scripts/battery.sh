bat=$(cat /sys/class/power_supply/BAT0/capacity)
stat=$(cat /sys/class/power_supply/AC/online)

if [[ $bat -le 20 ]]; then
  if [[ ! -f /tmp/battery_warning_send ]]; then
    dunstify -u "critical" "Battery warning!" "Battery is at ${bat}% - please attach charger!"
    touch /tmp/battery_warning_send
  fi
else
  rm -f /tmp/battery_warning_send
fi

if [ ! -d "/sys/class/power_supply/BAT0" ]; then
  bat="100"
  eww update batteryClass="batteryFull"
  eww update batteryIcon=""
elif [[ $stat == 1 ]]; then
  eww update batteryClass="batteryCharging"
  eww update batteryIcon=""
  eww update batterOver="true"
elif [[ $bat -le 10 ]]; then
  eww update batteryClass="batteryEmpty"
  eww update batteryIcon=""
elif [[ $bat -le 50 ]]; then
  eww update batteryClass="batteryHalf"
  eww update batteryIcon=""
elif [[ $bat -le 80 ]]; then
  eww update batteryClass="batteryHalf"
  eww update batteryIcon=""
else
  eww update batteryClass="batteryFull"
  eww update batteryIcon=""
fi

echo "$bat"
