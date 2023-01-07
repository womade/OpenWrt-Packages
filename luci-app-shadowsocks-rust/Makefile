#
# Copyright (C) 2016-2018 Jian Chang <aa65535@live.com>
#               2017-2022 honwen https://github.com/honwen
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-shadowsocks
PKG_VERSION:=2.0.5
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=honwen <https://github.com/honwen>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-shadowsocks/Default
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI Support for shadowsocks-rust
	PKGARCH:=all
	DEPENDS:=+iptables +ipset +curl +ip +iptables-mod-tproxy $(1)
endef

Package/luci-app-shadowsocks = $(call Package/luci-app-shadowsocks/Default,+ipset)

define Package/luci-app-shadowsocks/description
	LuCI Support for shadowsocks-rust.
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/files/luci/i18n/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-shadowsocks/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ -f /etc/uci-defaults/luci-shadowsocks ]; then
		( . /etc/uci-defaults/luci-shadowsocks ) && \
		rm -f /etc/uci-defaults/luci-shadowsocks
	fi
	rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
fi
exit 0
endef

define Package/luci-app-shadowsocks/conffiles
/etc/config/shadowsocks
endef

define Package/luci-app-shadowsocks/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/shadowsocks.*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/luci/controller/*.lua $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/shadowsocks
	$(INSTALL_DATA) ./files/luci/model/cbi/shadowsocks/*.lua $(1)/usr/lib/lua/luci/model/cbi/shadowsocks/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/shadowsocks
	$(INSTALL_DATA) ./files/luci/view/shadowsocks/*.htm $(1)/usr/lib/lua/luci/view/shadowsocks/
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./files/root/usr/share/rpcd/acl.d/luci-app-shadowsocks.json $(1)/usr/share/rpcd/acl.d/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/root/etc/config/shadowsocks $(1)/etc/config/shadowsocks
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/root/etc/init.d/shadowsocks $(1)/etc/init.d/shadowsocks
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/root/etc/uci-defaults/luci-shadowsocks $(1)/etc/uci-defaults/luci-shadowsocks
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/root/usr/bin/ss-rules$(2) $(1)/usr/bin/ss-rules
endef

$(eval $(call BuildPackage,luci-app-shadowsocks))
