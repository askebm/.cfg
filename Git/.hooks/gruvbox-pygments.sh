#!/usr/bin/bash

function recolor() {
	FILE=${1}
	cat ${FILE} | sed -e 's/282828/1c1c1c/g' | tee ${FILE}
}

recolor "${HOME}/Git/gruvbox-pygments/gruvbox.css"
recolor "${HOME}/Git/gruvbox-pygments/gruvbox/style.py"
