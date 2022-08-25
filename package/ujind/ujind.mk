################################################################################
#
# ujind
#
################################################################################

UJIND_VERSION_MAJOR = 0.1
UJIND_VERSION = $(UJIND_VERSION_MAJOR).0
UJIND_SOURCE = $(UJIND_VERSION).tar.gz
# UJIND_SITE_METHOD = local
# UJIND_SITE = $(TOPDIR)/../Dropbox/src/ujind
UJIND_SITE = https://github.com/bbingju/ujind/archive/refs/tags/$(UJIND_SOURCE)
UJIND_LICENSE = BSD-3-Clause
UJIND_LICENSE_FILES = COPYING
UJIND_INSTALL_STAGING = NO

ifeq ($(BR2_PACKAGE_UJIND),y)
define UJIND_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(@D)/scripts/ujind.service \
		$(TARGET_DIR)/usr/lib/systemd/system/ujind.service
endef
endif

$(eval $(cmake-package))
