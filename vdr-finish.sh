#!/bin/sh
rm -rf /vdr/config/bak_shutdown
mkdir -p /vdr/config/bak_shutdown
cp --parents -a -v /var/lib/vdr/* /vdr/config/bak_shutdown
cp --parents -a -v /etc/vdr/* /vdr/config/bak_shutdown
cp -a -v /var/lib/vdr/plugins/epgsearch/epgsearch.conf /vdr/config/var/lib/vdr/plugins/epgsearch/epgsearch.conf
cp -a -v /var/lib/vdr/timers.conf /vdr/config/var/lib/vdr/timers.conf

s6-svscanctl -t /var/run/s6/services
