# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-engines/gemrb/gemrb-0.8.2.ebuild,v 1.2 2015/02/06 13:40:34 ago Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )
WANT_CMAKE=always
inherit eutils python-any-r1 cmake-utils gnome2-utils games

DESCRIPTION="Reimplementation of the Infinity engine"
HOMEPAGE="http://gemrb.sourceforge.net/"
SRC_URI="mirror://sourceforge/gemrb/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

RDEPEND="media-libs/freetype
	media-libs/libpng:0
	>=media-libs/libsdl-1.2[video]
	media-libs/libvorbis
	media-libs/openal
	media-libs/sdl-mixer
	sys-libs/zlib
	${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

pkg_setup() {
	python-any-r1_pkg_setup
	games_pkg_setup
}

src_prepare() {
	sed -i \
		-e '/COPYING/d' \
		CMakeLists.txt || die
}

src_configure() {
	mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${GAMES_PREFIX}"
		-DBIN_DIR="${GAMES_BINDIR}"
		-DDATA_DIR="${GAMES_DATADIR}/gemrb"
		-DSYSCONF_DIR="${GAMES_SYSCONFDIR}/gemrb"
		-DLIB_DIR="$(games_get_libdir)"
		-DMAN_DIR=/usr/share/man/man6
		-DICON_DIR=/usr/share/pixmaps
		-DMENU_DIR=/usr/share/applications
		-DDOC_DIR="/usr/share/doc/${PF}"
		-DSVG_DIR=/usr/share/icons/hicolor/scalable/apps
		)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	dodoc README NEWS AUTHORS
	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	games_pkg_postinst
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
