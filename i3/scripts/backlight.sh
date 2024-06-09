#!/bin/bash

_backlight_path="/sys/class/backlight/intel_backlight/brightness"
_amount="$2"
_current=$(cat $_backlight_path)
_max=3423
_min=423

if [ ! -f $_backlight_path ]; then
    echo "couldn't find $_backlight_path"
    exit
fi

if [ ! -n "$_amount" ]; then
    echo "specify amount"
    exit
fi

if [ "$1" = "add" ]; then
    _next=$(($_current+$_amount))
elif [ "$1" = "neg" ]; then
    _next=$(($_current-$_amount))
else
    echo "arg should be add or neg"
    exit
fi

if [ "$_next" -gt "$_max" ]; then
    _next=3420
fi

if [ "$_next" -lt "$_min" ]; then
    _next=420
fi

echo $_next > $_backlight_path

return 0
