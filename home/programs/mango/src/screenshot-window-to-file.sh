notify-send -a 'Mango' 'Screenshot' 'Focused window to file'

f=$HOME/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S).png
grim -c '$f'
satty --filename '$f' --output-filename '$f' --actions-on-enter save-to-file --early-exit
