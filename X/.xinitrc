#!/bin/sh
xinput --set-prop 10 'Device Accel Profile' -1 &
xset s 0 s blank &
xset -dpms &
xrandr -r 120 &
xsetroot -cursor_name left_ptr &

