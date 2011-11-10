# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
USE_RUBY="ruby18"

inherit ruby-ng

DESCRIPTION=""
HOMEPAGE="http://homepage3.nifty.com/slokar/pasori/libpafe-ruby-0.0.7.tar.gz"
SRC_URI="http://homepage3.nifty.com/slokar/pasori/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/libpafe"
RDEPEND="${DEPEND}"

each_ruby_configure() {
	ruby extconf.rb || die
}

each_ruby_compile() {
	emake || die
}

each_ruby_install() {
	emake DESTDIR="${D}" install || die
}

