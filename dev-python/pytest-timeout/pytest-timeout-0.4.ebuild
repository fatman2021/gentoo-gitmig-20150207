# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pytest-timeout/pytest-timeout-0.4.ebuild,v 1.1 2014/11/22 09:43:43 jlec Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{2,3,4} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="py.test plugin to abort hanging tests"
HOMEPAGE="https://pypi.python.org/pypi/pytest-timeout"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-python/pytest"
DEPEND="${RDEPEND}"

python_test() {
	${EPYTHON} test_pytest_timeout.py || die
}
