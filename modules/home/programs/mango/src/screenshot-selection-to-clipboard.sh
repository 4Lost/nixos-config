notify-send -a 'Mango' 'Screenshot' 'Selection to clipboard'

g="$(slurp -d)"
[ -n "$g" ]
f="$(mktemp -t screenshot-XXX.png)"
grim -g "$g" "$f"
wl-copy <"$f"
rm -f "$f"
