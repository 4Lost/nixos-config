notify-send -a 'Mango' 'Screenshot' 'Selection to file'

g="$(slurp -d)"
[ -n '$g' ]
f="$HOME/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S).png"
grim -g "$g" "$f"
satty --filename "$f" --output-filename "$f" --actions-on-enter save-to-file --early-exit
