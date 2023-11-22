#!/bin/bash

interfaces=$(ip -o link show | awk -F': ' '!/lo/ && !/DOWN/ {print $2}')

result=""

set_color='%{F#80bfff}'
unset_color='%{F-}'

for i in $interfaces; do 
	address=$(ip -o -4 addr show $i | awk '{print $4}' | cut -d '/' -f 1)
	
	case $i in
		e*) i="LAN" ;;
		w*) i="WLAN" ;;
		t*) i="VPN" ;;
	esac

	result="$result$set_color$i $unset_color$address "
done

echo $result
