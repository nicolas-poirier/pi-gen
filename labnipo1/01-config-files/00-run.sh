#!/bin/bash -e

install -m 644 files/etc/dhcpcd.conf "${ROOTFS_DIR}/etc/dhcpcd.conf"
install -m 644 files/etc/dnsmasq.conf "${ROOTFS_DIR}/etc/dnsmasq.conf"
install -m 644 files/etc/sysctl.conf "${ROOTFS_DIR}/etc/sysctl.conf"
install -m 644 files/etc/sudoers.d/labnipo "${ROOTFS_DIR}/etc/sudoers.d/labnipo"
install -m 644 files/etc/systemd/system/autohotspot.service "${ROOTFS_DIR}/etc/systemd/system/autohotspot.service"
install -m 644 files/etc/wpa_supplicant/wpa_supplicant.conf "${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf"
install -m 644 files/usr/bin/autohotspotN "${ROOTFS_DIR}/usr/bin/autohotspotN"

on_chroot << EOF

# hostapd and dnsmasq will be controlled by the autohotspot service
systemctl unmask hostapd
systemctl disable hostapd
systemctl disable dnsmasq

chmod +x /usr/bin/autohotspotN
systemctl enable autohotspot.service

EOF
