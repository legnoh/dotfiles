#!/usr/bin/env bash

defaults read > /tmp/before_settings

read -p "Plase change config & Hit enter: "

defaults read > /tmp/after_settings

# get diff
/usr/bin/diff -n --color=always --ignore-matching-lines='"_' /tmp/before_settings /tmp/after_settings
col=$(/usr/bin/diff --color=always --ignore-matching-lines='"_' /tmp/before_settings /tmp/after_settings | head -n 1 | sed -n '1s/\([0-9]*\)c.*/\1/p')

# open code
/opt/homebrew/bin/code --goto /tmp/after_settings:${col}:0
