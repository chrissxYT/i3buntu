#!/bin/sh
i3status -c ~/.config/i3/i3status | sed "s/},{/},{\"name\":\"ellol\",\"full_text\":\"\",\"separator\":false,\"separator_block_width\":0},{/g"
