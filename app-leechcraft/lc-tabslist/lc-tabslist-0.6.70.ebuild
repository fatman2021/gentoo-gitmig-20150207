# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-leechcraft/lc-tabslist/lc-tabslist-0.6.70.ebuild,v 1.1 2014/08/03 19:04:38 maksbotan Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="Quick navigation between tabs in LeechCraft"

SLOT="0"
KEYWORDS=" ~amd64 ~x86"
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}"
RDEPEND="${DEPEND}"
