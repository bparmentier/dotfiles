# -*- coding: utf-8 -*-

import subprocess
import os

from i3pystatus import Status

status = Status(standalone=True)

# Clock
status.register("clock",
    format="⌚ %Y-%m-%d %H:%M",)

# CPU temperature
status.register("temp",
    file="/sys/class/thermal/thermal_zone1/temp",
    format="{temp:.0f}°C",
    interval=3,)

# Battery
status.register("battery",
    battery_ident="BAT",
    format="{percentage_design:.1f} % ({status})",
    alert=True,
    alert_percentage=10,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

# OpenVPN status
status.register("runwatch",
    name="VPN",
    path="/var/run/openvpn.pid",)

# DHCP
status.register("runwatch",
    name="DHCP",
    path="/var/run/dhcpcd*.pid",)

# Ethernet status (en0)
status.register("network",
    interface="en0",
    format_up="en0: {v4cidr}",)

# Ethernet status (usb0)
status.register("network",
    interface="usb0",
    format_up="usb0: {v4cidr}",)

# Wireless status (wl1)
status.register("wireless",
    interface="wl1",
    format_up="wl1: {v4cidr} ({essid} {quality:03.0f} %)",)

# Wireless status (wl0)
status.register("wireless",
    interface="wl0",
    format_up="wl0: {v4cidr} ({essid} {quality:03.0f} %)",)

# Disk usage (/home)
status.register("disk",
    path="/home",
    format="/home: {avail} GiB free",)

# Disk usage (/)
status.register("disk",
    path="/",
    format="/: {avail} GiB free",)

# Bitcoin price
status.register("bitcoin",
    currency="EUR",
    format="฿ {last_price} EUR",)

# ALSA Master status (muted/unmuted)
status.register("alsa",
    mixer="Master",
    format="V: ON",
    format_muted="V: OFF",)

# ALSA PCM volume
status.register("alsa",
    mixer="PCM",
    format="♪ {volume}",)

# MPD status
status.register("mpd",
    #host="192.168.1.36",
    format="{filename}[{artist} •] {title} {status}",
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    },)

status.run()
