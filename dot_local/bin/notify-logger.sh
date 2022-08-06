#!/bin/bash
#https://askubuntu.com/questions/770218/how-can-i-log-all-notify-send-actions

logfile=$1

dbus-monitor "interface='org.freedesktop.Notifications'" >> "$logfile"
