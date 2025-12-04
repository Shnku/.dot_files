#!/bin/bash
CONFIG=~/.config/conky/conky.conf

full_string=$(grep "/sys/class/net" $CONFIG)
name="${full_string#*/sys/class/net/}"
OLD="${name%/*}"
#echo "$full_string -> $name -> $OLD"

NEW=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | head -n1)
#echo $NEW

if [[ "$OLD" == "$NEW" ]]; then exit; fi

if [[ "$NEW" == "" ]]; then 
  #echo "new is empty"
  exit; 
fi
if [[ "$OLD" != "$NEW" ]]; then
  #echo "string are not equal"
  sed -i "s/${OLD}/${NEW}/g" $CONFIG
#else
  #echo "strings are equal"
fi

#conky -c <(sed "s/net_iface/${NEW}/g" $CONFIG )
