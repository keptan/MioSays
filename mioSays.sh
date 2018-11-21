#!/bin/bash
icon=$(ls icons/ | sort -R | head -n 1);
bubble=$(ls bubbles/ | sort -R | head -n 1);
IFS=';' read -ra sizeArgs <<< "$bubble"

downFromTitle=74
boxSize=${sizeArgs[0]}
boxPos=${sizeArgs[1]}
iconPos=${sizeArgs[2]}
iconWidth=$( identify -ping -format "%w" icons/$icon);
mouthDown=$(( $downFromTitle+$iconPos-$icon))

noLineText="$(sed 's/--.*//g' | tr '\n' ' ')"

convert -background transparent -fill black -font KAWAIITEGAKIMOJI -size ${sizeArgs[0]} -gravity Center caption:"$noLineText" miff:- |\
convert bubbles/$bubble - -gravity NorthWest -compose Over -geometry "${sizeArgs[1]}" -composite miff:- |\
convert -background transparent -page -300-0 title.png -page +0+$downFromTitle - -page -$iconWidth+$mouthDown icons/$icon -layers merge $1
