#!/bin/sh

head --lines=-1 $1 > temp
echo "$2" >> temp
tail --lines=1 $1 >> temp
mv temp $1
