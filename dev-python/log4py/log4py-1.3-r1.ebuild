# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/log4py/log4py-1.3-r1.ebuild,v 1.1 2014/12/31 01:53:17 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A python logging module similar to log4j"
HOMEPAGE="http://www.its4you.at/english/log4py.html"
SRC_URI="http://www.its4you.at/downloads/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~sparc ~x86"
IUSE="doc"

DEPEND=""
RDEPEND=""

DOCS="doc/AUTHORS doc/ChangeLog database/* log4py-test.py"

python_install_all() {
	use doc && local HTML_DOCS=( doc/html/. )
	distutils-r1_python_install_all
}

python_install() {
	distutils-r1_python_install
	insinto /etc
	doins log4py.conf
}
