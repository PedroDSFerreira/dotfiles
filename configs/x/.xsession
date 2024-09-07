#!/bin/sh

# if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
# 	eval $(dbus-launch --exit-with-session --sh-syntax)
# fi
# systemctl --user import-environment DISPLAY XAUTHORITY
#
# if command -v dbus-update-activation-environment >/dev/null 2>&1; then
#         dbus-update-activation-environment DISPLAY XAUTHORITY
# fi

# Run programs at startup
# picom &
# polybar &
# nm-applet &
# blueman-applet &
# kdeconnect-indicator &

# xset -b &

sh $SCRIPTS_DIR/background.sh

# exec awesome
