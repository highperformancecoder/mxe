# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qwt5_qt5
$(PKG)_WEBSITE  := https://github.com/highperformancecoder/qwt5-qt5
$(PKG)_DESCR    := Qwt5 built for Qt5
$(PKG)_VERSION  := 5.2.3-beta.1
$(PKG)_CHECKSUM := dc007238067dd544d968d8776b9415ad866e532e1b41cd5508b6b9728af33b3c
$(PKG)_SUBDIR   := qwt5-qt5-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_VERSION).zip
$(PKG)_URL      := $($(PKG)_WEBSITE)/archive/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc qt5

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://sourceforge.net/projects/qwt/files/qwt/' | \
    $(SED) -n 's,.*/\([0-9][^"]*\)/".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    $(if $(BUILD_STATIC),\
	sed -i -e 's/+= QwtDll/-= QwtDll/' '$(1)/qwtconfig.pri')

#    sed -i -e 's/target.path.*$$/target.path = $$$$PREFIX\/lib\/qwt5/' '$(1)/qwtconfig.pri'
#    sed -i -e 's/headers.path.*$$/headers.path = $$$$PREFIX\/include\/qwt5/' '$(1)/qwtconfig.pri'

    # build
    cd '$(SOURCE_DIR)' && $(PREFIX)/$(TARGET)/qt5/bin/qmake \
        -after \
        'SUBDIRS -= doc designer' \
        'CONFIG -= debug_and_release'
    $(MAKE) -C '$(SOURCE_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(SOURCE_DIR)' -j 1 install
#    cd '$(1)/src' && $(PREFIX)/$(TARGET)/qt5/bin/qmake 
    $(MAKE) -C '$(1)' -j '$(JOBS)' install

endef

