#!/bin/bash

options="1 - Screenshot\n2 - Screenshot to Clipboard\n3 - All Windows\n4 - All Window after 5 Seconds"

choice=$(echo -e "$options" | fuzzel --dmenu --prompt="Capture: ")

case "$choice" in
	"1 - Screenshot")
		grim -g "$(slurp)"
		thunar ~/Pictures
		;;
	"2 - Screenshot to Clipboard")
		grim -g "$(slurp)" - | wl-copy
		notify-send "Screenshot Copied to Clipboard"
		;;
	"3 - All Windows")
		grim
		thunar ~/Pictures
		;;
	"4 - All Windows after 5 Seconds")
		sleep 5
		grim
		thunar ~/Pictures
		;;
	*)
		echo "No valid option selected."
		;;
esac
