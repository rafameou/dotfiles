#!/bin/bash

# This script handles rotation of the screen and related input devices automatically
# using the output of the monitor-sensor command (part of the iio-sensor-proxy package)
# for sway.
# The target screen and input device names should be configured in the below variables.
# Note: input devices using the libinput driver (e.g. touchscreens) should be included
# in the WAYLANDINPUT array.  
#
# You can get a list of input devices with the `swaymsg -t output` command.
#
# This scritp was frok from https://gitlab.com/snippets/1793649 by Fishonadish 


SCREEN="eDP-1"
WAYLANDINPUT=("1003:35375:Atmel_Atmel_maXTouch_Digitizer")

function reconfigure_big {  
    ln -sf $HOME/.config/i3status-rust/config-top-big.toml $HOME/.config/i3status-rust/config-top.toml
    ln -sf $HOME/.config/i3status-rust/config-bottom-big.toml $HOME/.config/i3status-rust/config-bottom.toml

    swaymsg reload
}

function reconfigure_small {
    ln -sf $HOME/.config/i3status-rust/config-top-small.toml $HOME/.config/i3status-rust/config-top.toml
    ln -sf $HOME/.config/i3status-rust/config-bottom-small.toml $HOME/.config/i3status-rust/config-bottom.toml

    swaymsg reload
}

function rotate_ms {
    case $1 in
        "normal")
	    reconfigure_big
            rotate 0
            ;;
        "right-up")
            reconfigure_small
            rotate 90
            ;;
        "bottom-up")
	    reconfigure_big
	    rotate 180
            ;;
        "left-up")
	    reconfigure_small
            rotate 270
            ;;
    esac
}

function rotate {

    TARGET_ORIENTATION=$1

    echo "Rotating to" $TARGET_ORIENTATION

    swaymsg output $SCREEN transform $TARGET_ORIENTATION

    for i in "${WAYLANDINPUT[@]}" 
    do
        swaymsg input "$i" map_to_output "$SCREEN"
    done

}

while IFS='$\n' read -r line; do
    rotation="$(echo $line | sed -En "s/^.*orientation changed: (.*)/\1/p")"
    [[ !  -z  $rotation  ]] && rotate_ms $rotation
done < <(stdbuf -oL monitor-sensor)

