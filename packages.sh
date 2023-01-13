#!/bin/bash

git clone https://github.com/kiddin9/openwrt-packages

rm -rf openwrt-packages/*.md
mv -n openwrt-packages/* ./ ; rm -Rf openwrt-packages




# Default IP
sed -i 's/192.168.1.1/10.0.0.1/g' base-files/files/bin/config_generate

# Hostname
sed -i 's/OpenWrt/SuperNet/g' base-files/files/bin/config_generate
sed -i 's/OpenWrt/SuperNet/g' my-default-settings/files/etc/uci-defaults/99-default-settings

# NTP
sed -i 's/ntp.aliyun.com/ntp.ssss.fun/g' my-default-settings/files/etc/uci-defaults/99-default-settings
sed -i 's/0.openwrt.pool.ntp.org/pool.ntp.org/g' my-default-settings/files/etc/uci-defaults/99-default-settings

# Timezone
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='Asia\/Shanghai'/g" base-files/files/bin/config_generate

# Modify banner
wget --no-check-certificate https://github.com/womade/LEDE_actions/raw/main/modify/etc/banner -O base-files/files/etc/banner

# Theme Edge
wget --no-check-certificate https://github.com/womade/OpenWrt-Themes/raw/main/luci-theme-edge/htdocs/luci-static/edge/logo.png -O luci-theme-edge/htdocs/luci-static/edge/logo.png
wget --no-check-certificate https://github.com/womade/OpenWrt-Themes/raw/main/luci-theme-edge/htdocs/luci-static/edge/favicon.ico -O luci-theme-edge/htdocs/luci-static/edge/favicon.ico
sed -i "s|https://cdn.jsdelivr.net/gh/kkkidding/custom2@master/audio.ogg|https://cdn.ssss.fun/media/sound/edge/audio.ogg|g" luci-theme-edge/luasrc/view/themes/edge/sysauth.htm

sed -i "s/%D/SuperNet/g" base-files/files/etc/openwrt_release
sed -i "s/by Kiddin'/@ Y-ZHENG/g" base-files/files/etc/openwrt_release
sed -i "s/Kiddin/Y-ZHENG/g" opkg/patches/user_agent.patch
sed -i "s/Kiddin'/Y-ZHENG/g" luci-app-gpsysupgrade/Makefile
sed -i "s/Kiddin'/Y-ZHENG/g" my-default-settings/Makefile

wget --no-check-certificate https://github.com/womade/OpenWrt-Packages/raw/main/.github/diy/luci/links.htm -O my-default-settings/files/usr/lib/lua/luci/view/admin_status/index/links.htm


sed -i "s/supes.top/ssss.fun/g" my-default-settings/files/etc/uci-defaults/99-default-settings
sed -i "s/supes.top/ssss.fun/g" luci-app-attendedsysupgrade/root/etc/config/attendedsysupgrade
sed -i "s/supes.top/ssss.fun/g" luci-app-attendedsysupgrade/htdocs/luci-static/resources/view/attendedsysupgrade/overview.js
sed -i "s/supes.top/ssss.fun/g" luci-app-gpsysupgrade/luasrc/model/cbi/gpsysupgrade/sysupgrade.lua
sed -i "s/supes.top/ssss.fun/g" luci-app-gpsysupgrade/root/etc/hotplug.d/online/50-opkg-restore
sed -i "s/supes.top/ssss.fun/g" luci-app-gpsysupgrade/luasrc/view/gpsysupgrade/system_version.htm
sed -i "s/supes.top/ssss.fun/g" my-default-settings/files/etc/nginx/conf.d/webdav.conf.sample


# EXIT
rm -rf ./*/.git
rm -f ./*/.gitattributes
rm -rf ./*/.svn
rm -rf ./*/.github
rm -rf ./*/.gitignore
rm -rf LICENSE
exit 0  
