#!/bin/sh
i3status -c ~/.config/i3/i3status | while :
do
        read line
	echo $line | sed "s/}]/},{\"name\":\"aha\",\"full_text\":\" 💻 $(ybacklight Sc\\/Sm)\"}]/g"
done
