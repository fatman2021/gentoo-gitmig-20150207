# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/gnuplot/gnuplot-2.6.2-r2.ebuild,v 1.2 2014/11/03 15:40:28 mrueg Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="AUTHORS.txt ChangeLog README.textile"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Gnuplot drawing library - Ruby Bindings"
HOMEPAGE="http://rgplot.rubyforge.org/"

LICENSE="BSD"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="test"
SLOT="0"

RDEPEND+=" sci-visualization/gnuplot"

all_ruby_prepare() {
	# Existing metadata causes a crash in jruby, so use our own.
	rm ../metadata || die "Unable to remove metadata."
}

each_ruby_test() {
	${RUBY} -Ctest test_gnuplot.rb || die
}
