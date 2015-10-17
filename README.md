nm-plugin-splitdns
==================

**A plugin/dispatcher script for NetworkManager and dnsmasq**

This tool is a "plugin" for NetworkManager in form of a dispatcher script 
(located under /etc/NetworkManager/dispatcher.d) which starts/stops 
dnsmasq. It listens on "vpn-up" or "vpn-down" events given by network-manager.

in my case I use it to:

1. get a splitting DNS server running on my laptop to keep name resolution for 
   my local network and being able to resolve dns names from the DNS server in
   my companies network

**REQUIREMENTS**

dnsmasq installed

**DEBIAN PACKAGES**
commits for debian/ubuntu packaging are welcome!

**Known Issues**

* If vpn is not shut down correctly, the settings in your /etc/resolv.conf might
  be broken, as Networkmanager doesn`t touch a modified file. In this case just 
  delete /etc/resolv.conf an reconnect your network (Lan/Wan/WLAN etc.) to 
  recreate your /etc/resolv.conf
