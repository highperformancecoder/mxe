# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := sip
$(PKG)_WEBSITE  := https://riverbankcomputing.com/news
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.19.6
$(PKG)_CHECKSUM := f3d80120ee1fcf34bd30bb7be68b67da938a3afbd9a8ed7c0de7ed193b859707
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)/siplib
$(PKG)_FILE     := sip-$($(PKG)_VERSION).zip
$(PKG)_URL      := https://$(SOURCEFORGE_MIRROR)/project/pyqt/$(PKG)/$(PKG)-$($(PKG)_VERSION)/$(PKG)-$($(PKG)_VERSION).zip
DEPS     := gcc python

define $(PKG)_UPDATE
    echo 'TODO: write update script for $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    cd '$(SOURCE_DIR)'/.. && python configure.py
    cp plugins/python/CMakeLists.txt.sip '$(SOURCE_DIR)'/CMakeLists.txt
    cd '$(BUILD_DIR)' && $(TARGET)-cmake '$(SOURCE_DIR)' 
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' install
endef
