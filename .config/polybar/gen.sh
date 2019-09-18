#!/bin/sh
dir=`dirname $0`
cat $dir/global | sed "/MODULES_HERE/{
s/.*//g
r $dir/Omen
}" > $dir/config
