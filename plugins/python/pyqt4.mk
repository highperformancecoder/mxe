# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := pyqt4
$(PKG)_WEBSITE  := https://riverbankcomputing.com/news
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.12.1
$(PKG)_CHECKSUM := 225bcc1d62c96a38a4876ccf4bd05dbc06494e43efc9a6b1b2d92cb955814e5c
$(PKG)_SUBDIR   := PyQt4_gpl_win-$($(PKG)_VERSION)
$(PKG)_FILE     := PyQt4_gpl_win-$($(PKG)_VERSION).zip
$(PKG)_URL      := https://$(SOURCEFORGE_MIRROR)/project/pyqt/PyQt4/PyQt-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc qt python

define $(PKG)_UPDATE
    echo 'TODO: write update script for $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
     cd $(SOURCE_DIR) && python configure-ng.py --qmake=$(PREFIX)/$(TARGET)/qt/bin/qmake --sip=$(PREFIX)/bin/$(TARGET)-sip $(if $(BUILD_STATIC),--static,) --confirm-license --verbose --no-tools --sipdir $(PREFIX)/$(TARGET)/share/sip/PyQt4 --destdir=$(PREFIX)/$(TARGET)/lib/python2.7/site-packages --sysroot=$(PREFIX)/$(TARGET)
     $(MAKE) -C '$(1)' -j '$(JOBS)'
     $(MAKE) -C '$(1)' -j install
endef
