# [K] (C)2020
# http://github.com/kongfl888

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-autorewan
PKG_VERSION:=1.0
PKG_RELEASE:=2
PKG_DATE:=20200623

PKG_MAINTAINER:=kongfl888 <kongfl888@outlook.com>
PKG_LICENSE:=GPL-3.0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Application to redial the connection
  PKGARCH:=all
  DEPENDS:=+luci +bash
endef

define Package/$(PKG_NAME)/description
	LuCI Application to redial the connection
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/autorewan
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/config
	cp ./root/etc/config/autorewan $(1)/etc/config/autorewan

	$(INSTALL_DIR) $(1)/etc/init.d
	cp ./root/etc/init.d/autorewan $(1)/etc/init.d/autorewan

	$(INSTALL_DIR) $(1)/usr/bin
	cp ./root/usr/bin/dorewan $(1)/usr/bin/dorewan

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	po2lmo ./po/zh-cn/autorewan.po $(1)/usr/lib/lua/luci/i18n/autorewan.zh-cn.lmo
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
    chmod a+x $${IPKG_INSTROOT}/etc/init.d/autorewan >/dev/null 2>&1
    chmod a+x $${IPKG_INSTROOT}/usr/bin/dorewan >/dev/null 2>&1
    exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
    sed -i '/dorewan/d' /etc/crontabs/root >/dev/null 2>&1 || echo ""
    exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

