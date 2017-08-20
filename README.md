# xx-vdr
* based on doublexminus/xx-ubuntu14.04-s6-base

* added VDR-Installation from yavdr-PPAs (http://ppa.launchpad.net/yavdr/)
* added vdr-plugin-satip from sources (https://github.com/rofafor/vdr-plugin-satip/archive/vdr-2.2.x.tar.gz)

## Configs
* The Config-Folder
	* /config/basic - Scripts which would be build within the docker-image
	* /config/etc - Files within will be copied on startup of the container (use same path as file in container; see volume /config)
	* /config/var - Files within will be copied on startup of the container (use same path as file in container; see volume /config)

## Usage
* Exposed Ports:
	* 2004 - Streamdev-Clients
	* 3000 - Streamdev-Webserver
	* 6420 - SVDRP
	* 8002
	* 8008 - VDR-Live
	* 4010-4020/udp - SatIp (rtsp-ports)

docker run -i -t -v /path/to/config:/config -p port_local:port_container doublexminus/xx-vdr