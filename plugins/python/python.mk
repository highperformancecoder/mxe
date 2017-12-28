# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := python
$(PKG)_WEBSITE  := https://www.python.org/
$(PKG)_OWNER    := https://github.com/highperformancecoder
$(PKG)_DESCR    := Python library
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.7.14
$(PKG)_CHECKSUM := 304c9b202ea6fbd0a4a8e0ad3733715fbd4749f2204a9173a58ec53c32ea73e8
$(PKG)_DEPS     := 
$(PKG)_FILE     := Python-$($(PKG)_VERSION).tgz
$(PKG)_SUBDIR   := Python-$($(PKG)_VERSION)
$(PKG)_URL      := https://www.python.org/ftp/python/$($(PKG)_VERSION)/Python-$($(PKG)_VERSION).tgz

define $(PKG)_BUILD
    # patch cannot add new files, so add them here
    cp plugins/python/{pyconfig.h,CMakeLists.txt} '$(SOURCE_DIR)'
    cd '$(SOURCE_DIR)'/Modules && cp config.c.in config.c
    cd '$(BUILD_DIR)' && $(TARGET)-cmake '$(SOURCE_DIR)' 
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' install
endef
