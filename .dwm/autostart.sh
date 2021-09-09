# lanuch polkit auth agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
pamac-tray &

dex -a &
# xrandr --output Virtual1 --mode 1920x1080 &
picom -CGb &
~/.fehbg &
# nitrogen --restore &

# dwmblocks $
slstatus &

# conky 
pkill conky 
conky -b &
