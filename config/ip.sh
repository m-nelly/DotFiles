#!/bin/sh

interfaces=$(ip -o link show | awk -F': ' '!/ lo/ && !/v/ && !/DOWN/ {print $2}')

result=""

for interface in $interfaces; do 
	address=$(ip -o -4 addr show $interface | awk '{print $4}' | cut -d '/' -f 1)
	
	case $interface in
		e*) icon='󰈀  ' ;;
		w*) icon='  ' ;;
		t*) icon='󰖂  ' ;;
	esac

	result="$result$icon$address "
done

echo "$result"
