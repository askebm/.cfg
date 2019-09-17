#!/bin/sh
dir=`dirname $0`
cat $dir/global > $dir/config
cat $dir/$(cat /etc/hostname) >> $dir/config
