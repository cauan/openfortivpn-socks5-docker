# openfortivpn-socks5-docker
A Docker image that uses OpenFortiVPN to establish a VPN connection to a FortiVPN service and starts a local SOCKS5 server.

## How to build it
docker build . -t openfortivpn-socks5-docker

## How to run it
docker run -it --rm -p 1080:1080 --privileged --name vpn openfortivpn-socks5-docker SERVER:443 -u USERNAME -p "PASSWORD" 

or 

docker run -it --rm -p 1080:1080 --privileged --name vpn cauan/openfortivpn-socks5 SERVER:443 -u USERNAME -p "PASSWORD" 
