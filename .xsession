# lanuch polkit auth agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

pamac-tray &

dex -a &
# xrandr --output Virtual1 --mode 1920x1080 &
# picom -CGb &
~/.fehbg &
# nitrogen --restore &

pkill dwmblocks 
dwmblocks 2>&1 >/dev/null &
# slstatus 2>&1 >/dev/null &

# conky 
pkill conky 
conky -b &
# plank 2>&1 >/dev/null &
