#!/bin/sh
base64 /dev/urandom | awk '{print(0==NR%10)?"":$1}' | sed 's/[^[:alpha:]]/ /g' | head -"$1"
echo "finished"
