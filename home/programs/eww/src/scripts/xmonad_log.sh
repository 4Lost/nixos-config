tail -F /tmp/xmonad-eww-log | while read -r line; do
  clean_line=$(echo "$line" | sed -E 's/<[^>]+>//g')
  eww update xmonad_log="$clean_line"
done
