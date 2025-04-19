#!/bin/sh

interfaces=$(ip -o link show | awk -F': ' '!/ lo/ && !/v/ && !/DOWN/ {print $2}')

result=""

for i in $interfaces; do 
	address=$(ip -o -4 addr show $i | awk '{print $4}' | cut -d '/' -f 1)
	
	case $i in
		e*) i="󰈀 " ;;
		w*) i=" " ;;
		t*) i="󰖂 " ;;
	esac

	result="$result$i$address "
done

echo $result
