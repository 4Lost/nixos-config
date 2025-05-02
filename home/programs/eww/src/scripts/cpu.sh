cpu_idle=$(top -bn1 | awk '/Cpu\(s\)/ {print $8}')
cpu_used=$(awk "BEGIN {print 100 - $cpu_idle}")

# Print only the numeric result
printf "%.0f\n" "$cpu_used"
