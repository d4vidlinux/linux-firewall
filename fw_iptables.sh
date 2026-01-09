#!/usr/bin/env bash

#Simple firewall configuration

#Clean firewall rules
iptables -F
iptables -X
iptables -Z

#Disable all incoming and outgoing traffic
iptables -P OUTPUT DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP

#Accept the handshake
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#Allow OUTPUT protocols [SSH, HTTP, HTTPS, DNS]
iptables -A OUTPUT -m multiport -p tcp --dports 22,80,443 -j ACCEPT
iptables -A OUTPUT -p udp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

#Loopback
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT

# ================= SSH ACCESS (OPTIONAL) =================
# By default, this firewall does NOT allow inbound SSH.
# Uncomment ONE of the options below if needed.

# Allow SSH from ANY IP (less secure)
# iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow SSH ONLY from a specific IP (recommended)
# iptables -A INPUT -p tcp -s <IP> --dport 22 -j ACCEPT


#Save
iptables-save > fw.rules
