#!/bin/bash
 
###
 #  @file      monitors.sh
 #  @brief     Configure monitors
 #  @details   Setup monitors on system
 #  @copyright 2026 - ivWatch
###
 
#!/usr/bin/env bash
set -euo pipefail

# Use stable monitor identity (from `hyprctl monitors`)
LAPTOP="eDP-1"
LEFT_DSC='description: LG Electronics LG ULTRAWIDE 0x0005456D'
RIGHT_DSC='description: LG Electronics LG ULTRAWIDE 0x0004CB4A'
HOME_DSC='description: Samsung Electric Company C32F391 H4ZM500489'
HOME_DSC2='description: Dell Inc. AW3425DWM 6PMXF94'
LEFT='desc:LG Electronics LG ULTRAWIDE 0x0005456D'
RIGHT='desc:LG Electronics LG ULTRAWIDE 0x0004CB4A'
HOME_MON='desc:Samsung Electric Company C32F391 H4ZM500489'
HOME_MON2='desc:Dell Inc. AW3425DWM 6PMXF94'



hyprctl reload

lid_closed() {
  grep -q closed /proc/acpi/button/lid/*/state 2>/dev/null
}

has_monitor() {
  hyprctl monitors | grep -q "$1"
}

if has_monitor "$LEFT_DSC" && has_monitor "$RIGHT_DSC"; then

    # Docked layout: DP-5 on the left, DP-4 on the right
    hyprctl keyword monitor "$LEFT,preferred,0x0,1"
    hyprctl keyword monitor "$RIGHT,preferred,3440x0,1"
    hyprctl keyword monitor "$HOME_MON,disable"
    hyprctl keyword monitor "$HOME_MON2,disable"

    # Laptop panel: only disable when lid is closed
    if lid_closed; then
        hyprctl keyword monitor "$LAPTOP,disable"
    sleep 0.2

        # DP-5 gets WS1, DP-4 gets WS2
        hyprctl dispatch moveworkspacetomonitor 2 "$RIGHT"
        hyprctl dispatch moveworkspacetomonitor 1 "$LEFT"

        # Make sure they exist + land where you expect
        hyprctl dispatch focusmonitor "$RIGHT"
        hyprctl dispatch workspace 2
        hyprctl dispatch focusmonitor "$LEFT"
        hyprctl dispatch workspace 1
    else
        hyprctl keyword monitor "$LAPTOP,preferred,6880x0,2"

        # Optional: still enforce mapping even with lid open
        hyprctl dispatch moveworkspacetomonitor 1 "$RIGHT"
        hyprctl dispatch moveworkspacetomonitor 2 "$LEFT"
    fi

elif has_monitor "$HOME_DSC" || has_monitor "$HOME_DSC2"; then

    if has_monitor "$HOME_DSC"; then
        mon="$HOME_MON"
    else
        mon="$HOME_MON2"
    fi

    printf "I am working from !!\n"
    hyprctl keyword monitor "$mon,preferred,0x0,1"
    hyprctl keyword monitor "$LAPTOP,preferred,3440x0,2"

    hyprctl keyword monitor "$LEFT,disable"
    hyprctl keyword monitor "$RIGHT,disable"

    # Laptop panel: only disable when lid is closed
    if lid_closed; then
        hyprctl keyword monitor "$LAPTOP,disable"

        # DP-5 gets WS1, DP-4 gets WS2
        hyprctl dispatch moveworkspacetomonitor 1 "$mon"

        # Make sure they exist + land where you expect
        hyprctl dispatch focusmonitor "$mon"
        hyprctl dispatch workspace 1
    else
        # DP-5 gets WS1, DP-4 gets WS2
        hyprctl dispatch moveworkspacetomonitor 1 "$mon"
        hyprctl dispatch moveworkspacetomonitor 2 "$LAPTOP"

        # Make sure they exist + land where you expect
        hyprctl dispatch focusmonitor "$mon"
        hyprctl dispatch workspace 1
        hyprctl dispatch focusmonitor "$LAPTOP"
        hyprctl dispatch workspace 2
    fi
    sleep 0.2

else
    printf "Laptop only!\n"
    # Undocked: laptop only
    hyprctl keyword monitor "$LAPTOP,preferred,0x0,2"
    hyprctl keyword monitor "$LEFT,disable"
    hyprctl keyword monitor "$RIGHT,disable"
    hyprctl keyword monitor "$HOME_MON,disable"
    hyprctl keyword monitor "$HOME_MON2,disable"
fi
