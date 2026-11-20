mem_info=$(free | grep Mem)
used=$(echo "$mem_info" | awk '{print $3}')
total=$(echo "$mem_info" | awk '{print $2}')
mem_used=$(awk "BEGIN {print int($used/$total * 100)}")

echo "$mem_used"
