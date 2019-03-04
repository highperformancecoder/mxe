# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qwtplot3d
$(PKG)_WEBSITE  := https://github.com/sintegrial/qwtplot3d
$(PKG)_DESCR    := QwtPlot3D
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := d80c908
$(PKG)_CHECKSUM := 41a241a5efa7bf72b21de67792fbc5c7e273cea70a445673a41a310ea71318d8
$(PKG)_GH_CONF  := sintegrial/qwtplot3d/branches/master
$(PKG)_DEPS     := cc qtbase zlib

$(PKG)_QT_DIR   := qt5

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && '$(PREFIX)/$(TARGET)/$($(PKG)_QT_DIR)/bin/qmake' '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
# qmake bizarrely not generating an install target!!
#    $(MAKE) -C '$(BUILD_DIR)' -j 1 install
    cp -r '$(SOURCE_DIR)/include' '$(PREFIX)/$(TARGET)/include/qwtplot3d'
    cp -r '$(BUILD_DIR)/lib/libqwtplot3d.a' '$(PREFIX)/$(TARGET)/lib'
endef

