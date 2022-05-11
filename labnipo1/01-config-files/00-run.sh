#!/bin/bash -e

copy_overlay /etc/dhcpcd.conf -o root -g root -m 600
copy_overlay /etc/dnsmasq.conf -o root -g root -m 600
copy_overlay /etc/sysctl.conf -o root -g root -m 600
copy_overlay /etc/sudoers.d/labnipo -o root -g root -m 600
copy_overlay /etc/systemd/system/autohotspot.service -o root -g root -m 600
copy_overlay /etc/wpa_supplicant/wpa_supplicant.conf -o root -g root -m 600
copy_overlay /usr/bin/autohotspotN -o root -g root -m 600

# hostapd and dnsmasq will be controlled by the autohotspot service
systemctl unmask hostapd
systemctl disable hostapd
systemctl disable dnsmasq

chmod +x /usr/bin/autohotspotN
systemctl enable autohotspot.service
