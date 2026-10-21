notify-send -a 'Mango' 'Screenshot' 'Focused window to clipboard'

f=$(mktemp -t screenshot-XXX.png)
grim '$f'
wl-copy <'$f'
rm -f '$f'
