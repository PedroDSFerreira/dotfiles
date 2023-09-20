#!/bin/sh



# Choose primary monitor
if type "xrandr"; then

  MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)
  # split string to array
  array=($(echo $MONITORS | tr "," "\n"))
  len=${#array[@]}

  if [ $len -ne 1 ]; then
	  xrandr --output ${array[1]} --auto --primary --output ${array[0]} --auto --left-of ${array[1]}

  else
	  xrandr --output ${array[0]} --primary --auto
	
  fi
fi

xrandr --auto



# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar mybar 2>&1 | tee -a /tmp/polybar.log &