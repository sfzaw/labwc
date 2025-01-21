#!/bin/bash

options="Screenshot\nScreenshot to Clipboard\nAll Windows\nAll Window after 5 Seconds"

choice=$(echo -e "$options" | fuzzel --dmenu --prompt="Capture: ")

case "$choice" in
	"Screenshot")
		grim -g "$(slurp)"
		thunar ~/Pictures/Screenshots
		;;
	"Screenshot to Clipboard")
		grim -g "$(slurp)" - | wl-copy
		notify-send "Screenshot Copied to Clipboard"
		;;
	"All Windows")
		grim
		thunar ~/Pictures/Screenshots
		;;
	"All Windows after 5 Seconds")
		sleep 5
		grim
		thunar ~/Pictures/Screenshots
		;;
	*)
		echo "No valid option selected."
		;;
esac
