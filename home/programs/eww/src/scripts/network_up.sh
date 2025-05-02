# You can change this if your interface is named differently (e.g., eth0, enp3s0)
INTERFACE=$(ip route get 1.1.1.1 | awk '{print $5; exit}')
TX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
TX_CUR=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
TX_RATE=$(((TX_CUR - TX_PREV) / 1024))

echo "${TX_RATE}"
