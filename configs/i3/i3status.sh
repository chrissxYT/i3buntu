#!/bin/sh
i3status -c ~/.config/i3/i3status | while :
do
        read line
	echo $line | \
		sed "s/}]/},{\"name\":\"aha\",\"full_text\":\" 💻 $(ybacklight Sc\\/Sm)\"}]/g" | \
		sed "s/📶 Gratis-Viren Google Wifi Edition/🏠/g" | \
		sed 's/ kb\/s/k/g' | \
		sed 's/ Mb\/s/M/g' | \
		sed 's/ Gb\/s/G/g' | \
		sed "s/( /(/g" | \
		sed "s/ )/)/g" | \
                sed "s/ ()//g" | \
                sed "s/()//g" | \
		sed "s/{\"name\":\"cpu_temperature\",\"instance\":\"\\/sys\\/devices\\/platform\\/coretemp.0\\/hwmon\\/hwmon1\\/temp1_input\",\"markup\":\"none\",\"full_text\":\"can't read temp\",\"separator\":false,\"separator_block_width\":0},//g" | \
		sed "s/{\"name\":\"cpu_temperature\",\"instance\":\"\\/sys\\/devices\\/platform\\/coretemp.0\\/hwmon\\/hwmon2\\/temp1_input\",\"markup\":\"none\",\"full_text\":\"can't read temp\",\"separator\":false,\"separator_block_width\":0},//g" | \
		sed "s/{\"name\":\"wireless\",\"instance\":\"wlp3s0\",\"color\":\"#FF0000\",\"markup\":\"none\",\"full_text\":\" wifi_down_remove_pls \",\"separator\":false,\"separator_block_width\":0},//g" | \
		sed "s/{\"name\":\"battery\",\"instance\":\"\\/sys\\/class\\/power_supply\\/BAT0\\/uevent\",\"markup\":\"none\",\"full_text\":\" no_battery_remove_pls \",\"separator\":false,\"separator_block_width\":0},//g" | \
		sed "s/{\"name\":\"ethernet\",\"instance\":\"eth0\",\"color\":\"#FF0000\",\"markup\":\"none\",\"full_text\":\" ethernet_down_remove_pls \",\"separator\":false,\"separator_block_width\":0},//g" | \
                sed "s/{\"name\":\"ethernet\",\"instance\":\"enp0s25\",\"color\":\"#FF0000\",\"markup\":\"none\",\"full_text\":\" ethernet_down_remove_pls \",\"separator\":false,\"separator_block_width\":0},//g" | \
		sed "s/{\"name\":\"battery\",\"instance\":\"\/sys\/class\/power_supply\/BAT0\/uevent\",\"markup\":\"none\",\"full_text\":\" . 1..,..% 0,00W \",\"separator\":false,\"separator_block_width\":0},//g" | \
		sed "s/},{/},{\"name\":\"ellol\",\"full_text\":\"\",\"separator\":false,\"separator_block_width\":0},{/g"
done
