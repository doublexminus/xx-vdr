#!/bin/sh
# `/sbin/setuser vdr` runs the given command as the user `vdr`.
# If you omit that part, the command will be run as root.
export LANG="de_DE.UTF-8"

# Set the uid:gid to run as
[ "$vdr_uid" ] && usermod  -o -u "$vdr_uid" vdr
[ "$vdr_gid" ] && groupmod -o -g "$vdr_gid" vdr

# Set folder permissions
# chown -r /recordings only if owned by root. We asume that means it's a docker volume
[ "$(stat -c %u:%g /recordings)" = "0:0" ] && chown vdr:vdr /recordings
[ "$(stat -c %u:%g /vdr/config)" = "0:0" ] && chown vdr:vdr /vdr/config
[ "$(stat -c %u:%g /vdr/cache)" = "0:0" ] && chown vdr:vdr /vdr/cache

# We need to preseed the volumes, just copy new files, no overwrite
cp -R /vdr/config/etc/* /etc
cp -R /vdr/config/var/* /var

rm -rf /vdr/config/bak_boot
mkdir -p /vdr/config/bak_boot
cp --parents -a -v /var/lib/vdr/* /vdr/config/bak_boot
cp --parents -a -v /etc/vdr/* /vdr/config/bak_boot

mv /srv/vdr/video /srv/vdr/video.bak
ln -s /recordings /srv/vdr/video
rm -rf /srv/vdr/video.bak

# Run vdr
exec s6-setuidgid vdr vdr
