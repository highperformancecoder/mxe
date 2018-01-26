# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := sip
$(PKG)_WEBSITE  := https://riverbankcomputing.com/news
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.19.6
$(PKG)_CHECKSUM := f3d80120ee1fcf34bd30bb7be68b67da938a3afbd9a8ed7c0de7ed193b859707
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := sip-$($(PKG)_VERSION).zip
$(PKG)_URL      := https://$(SOURCEFORGE_MIRROR)/project/pyqt/$(PKG)/$(PKG)-$($(PKG)_VERSION)/$(PKG)-$($(PKG)_VERSION).zip
$(PKG)_DEPS     := gcc python qt

define $(PKG)_UPDATE
    echo 'TODO: write update script for $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    cd '$(SOURCE_DIR)' && python configure.py --use-qmake --sysroot=$(PREFIX)//$(TARGET)
    cd '$(BUILD_DIR)' && qmake '$(SOURCE_DIR)'/sipgen/sipgen.pro
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    cp '$(BUILD_DIR)'/sip $(PREFIX)/bin/$(TARGET)-sip
    rm '$(BUILD_DIR)'/Makefile
    echo "LIBS+=-lpython2.7.dll" >>'$(SOURCE_DIR)'/siplib/siplib.pro
    cd '$(BUILD_DIR)' && $(PREFIX)/bin/$(TARGET)-qmake-qt4 '$(SOURCE_DIR)'/siplib/siplib.pro
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' install
# build puts sip.pyd in a different location than make install expects. Silently fail for statis builds
    -cp '$(BUILD_DIR)'/sip.pyd $(PREFIX)/$(TARGET)/lib/python2.7
endef
