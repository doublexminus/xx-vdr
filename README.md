# xx-vdr
Based on doublexminus/xx-ubuntu14.04-s6-base
 
Added VDR-Installation from yavdr-PPAs (http://ppa.launchpad.net/yavdr/)
Added vdr-plugin-satip from sources (https://github.com/rofafor/vdr-plugin-satip/archive/vdr-2.2.x.tar.gz)

## Usage
Exposed Ports:
*2004 - Streamdev-Clients
*3000 - Streamdev-Webserver
*6420 - SVDRP
*8002
*8008 - VDR-Live
*4010-4020/udp - SatIp (rtsp-ports)

docker run -i -t -v /path/to/config:/config -p <PortConfigs>