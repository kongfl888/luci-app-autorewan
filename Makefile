# [K] (C)2020
# http://github.com/kongfl888

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI support for ReWan
LUCI_DEPENDS:=+luci
LUCI_PKGARCH:=all
PKG_VERSION:=1.0
PKG_RELEASE:=0
PKG_SOURCE_URL:=https://github.com/kongfl888/luci-app-autorewan.git

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature

