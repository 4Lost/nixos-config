notify-send -a 'Mango' 'Screenshot' 'Focused screen to clipboard'

f=$(mktemp -t screenshot.png)
grim '$f'
wl-copy <'$f'
rm -f '$f'
