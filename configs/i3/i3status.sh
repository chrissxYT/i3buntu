#!/bin/sh
i3status -c ~/.config/i3/i3status | while :
do
        read line
	echo $line | \
		sed "s/}]/},{\"name\":\"aha\",\"full_text\":\" 💻 $(ybacklight Sc\\/Sm)\"}]/g" | \
		sed "s/📶 Gratis-Viren Google Wifi Edition/🏠/g" | \
                sed 's/ \(.\)b\/s/\1/g' | \
		sed 's/( /(/g' | \
		sed 's/ )/)/g' | \
                sed 's/ \?()//g' | \
                sed 's/{"name":"[a-z_]\+","instance":"[a-zA-Z0-9_.\/]\+","markup":"none","full_text":"can'\''t read [a-z]\+","separator":false,"separator_block_width":0},//g' | \
                sed 's/{"name":"[a-z_]\+","instance":"[a-zA-Z0-9_.\/]\+","color":"#[0-9A-F]\+","markup":"none","full_text":"can'\''t read [a-z]\+","separator":false,"separator_block_width":0},//g' | \
		sed 's/{"name":"[a-z_]\+","instance":"[a-zA-Z0-9_.\/]\+","markup":"none","full_text":" . 1\?..[,\.]..% 0[,\.]00W ","separator":false,"separator_block_width":0},//g' | \
		sed 's/},{/},{"name":"lol","full_text":"","separator":false,"separator_block_width":0},{/g'
done
