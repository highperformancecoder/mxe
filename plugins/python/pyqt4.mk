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
     echo "patches=$(PKG_PATCHES)"
     cd $(SOURCE_DIR) && python configure-ng.py --qmake=$(PREFIX)/$(TARGET)/qt/bin/qmake --sip=/usr/bin/sip --static --confirm-license --verbose
#    # don't build and install docs
#    (echo '# DISABLED'; echo 'all:'; echo 'install:') > '$(1)/docs/Makefile.in'
#    # mman-win32 is only a partial implementation
#    cd '$(1)' && ./configure \
#        $(MXE_CONFIGURE_OPTS) \
#        --disable-mmap \
#        CFLAGS="-O -ggdb" \
#        PKG_CONFIG='$(TARGET)-pkg-config'
#    $(MAKE) -C '$(1)' -j '$(JOBS)' bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= LDFLAGS="-no-undefined"
#    $(MAKE) -C '$(1)' -j 1 install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=
endef
