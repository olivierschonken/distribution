################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#      Copyright (C) 2020      351ELEC team (https://github.com/fewtarius/351ELEC)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="beetle-pcfx-lr"
PKG_VERSION="47c355b6a515aef6dc57f57df1535570108a0e21"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-pcfx-libretro"
PKG_URL="${PKG_SITE}/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="libretro implementation of Mednafen PC-FX."

PKG_TOOLCHAIN="make"

make_target() {
  if [ "${ARCH}" == "i386" -o "${ARCH}" == "x86_64" ]; then
    make platform=unix CC=${CC} CXX=${CXX} AR=${AR}
  else
    make platform=armv CC=${CC} CXX=${CXX} AR=${AR}
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp mednafen_pcfx_libretro.so ${INSTALL}/usr/lib/libretro/beetle_pcfx_libretro.so
}
