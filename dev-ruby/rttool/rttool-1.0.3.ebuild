# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/bluecloth/bluecloth-2.0.0.ebuild,v 1.1 2009/04/14 16:14:42 a3li Exp $

inherit ruby

DESCRIPTION="RT is a simple and human-readable table format"
HOMEPAGE="http://www.rubyist.net/~rubikitch/computer/rttool/"
SRC_URI="http://www.rubyist.net/~rubikitch/archive/${P}.tar.gz"

LICENSE="|| ( Ruby GPL-2 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

USE_RUBY="ruby18 ruby19"
DEPEND=">=dev-lang/ruby-1.8"
RDEPEND="${DEPEND}"

PATCHES="${FILESDIR}/${P}-destdir-gentoo.patch"

src_install() {
	DESTDIR="${D}" ruby_einstall "$@" || die
}
