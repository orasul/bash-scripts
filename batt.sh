#!/usr/bin/env bash
# I found it somewhere on WWW
# Made some changes
# And use it on my Laptop
#

BATTERY='/proc/acpi/battery/BAT1'

NOW=$( awk '/^rema/ {print $3}' $BATTERY/state )
MAX=$( awk '/^design capacity:/ {print $3}' $BATTERY/info )
STATE=$( awk '/^charging state:/ {print $3}' $BATTERY/state )
PRC=$(( $NOW * 100 / $MAX ))

NONE='\033[00m'
BOLD='\033[01m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'

case "$STATE" in
  'charged')
    BATSTATE="$BOLD=$NONE"
  ;;
  'charging')
    BATSTATE="$BOLD+$NONE"
  ;;
  'discharging')
    BATSTATE="$BOLD-$NONE"
  ;;
esac

COLOR=$RED

if [ $PRC -gt "20" ]
then
  COLOR=$YELLOW
fi

if [ $PRC -gt "50" ]
then
  COLOR=$GREEN
fi

echo -e "${COLOR}${PRC}%${NONE} ${BATSTATE}"
