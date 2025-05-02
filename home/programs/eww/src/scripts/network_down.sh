# You can change this if your interface is named differently (e.g., eth0, enp3s0)
INTERFACE=$(ip route get 1.1.1.1 | awk '{print $5; exit}')
RX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
sleep 1
RX_CUR=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)

# Calculate download/upload in KiB/s
RX_RATE=$(((RX_CUR - RX_PREV) / 1024))

# Output formatted for Eww
echo "${RX_RATE}"
