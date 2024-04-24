#!/bin/sh

mkdir /root/.ssh
cd /root/.ssh

# Host Key
ssh-keygen -A -v

# Client Keys
ssh-keygen -t rsa -b 4096 -f id_rsa -P ''
cp id_rsa.pub authorized_keys

# Add Server Keys
find /etc/ssh -name 'ssh_host*.pub' | xargs cat | xargs -IPUBKEY -P1 echo localhost PUBKEY >> known_hosts

cd /root

# Start SSHD
/usr/sbin/sshd -o "GatewayPorts yes" -o "AllowTcpForwarding yes"

ssh -D 0.0.0.0:1080 localhost /usr/bin/openfortivpn ${@}

