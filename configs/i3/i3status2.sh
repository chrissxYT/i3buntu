#!/bin/sh
~/.config/i3/i3status1.sh | sed "s/},{/},{\"name\":\"ellol\",\"full_text\":\"\",\"separator\":false,\"separator_block_width\":0},{/g"
