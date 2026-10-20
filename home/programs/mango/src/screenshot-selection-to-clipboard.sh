notify-send -a 'Mango' 'Screenshot' 'Selection to clipboard'

g=$(slurp -d)
[ -n '$g' ]
f=$(mktemp -t screenshot.png)
grim -g '$g' '$f'
wl-copy < '$f'
rm -f '$f'" # Selection to clipboard
