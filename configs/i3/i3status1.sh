#!/bin/sh
i3status -c ~/.config/i3/i3status | sed "s/]/,{\"name\":\"hallol\",\"full_text\":\" brightness: $(ybacklight cur)\"}]/"
