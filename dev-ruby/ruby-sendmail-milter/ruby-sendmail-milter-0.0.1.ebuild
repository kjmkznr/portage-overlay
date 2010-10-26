# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
USE_RUBY="ruby18"

inherit ruby

MY_P="${PN}_${PV}"

DESCRIPTION="Ruby interface to sendmail's Mail Filter API"
HOMEPAGE="http://raa.ruby-lang.org/project/sendmail-milter/"
SRC_URI="http://gregoire.lejeune.free.fr/${MY_P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="mail-filter/libmilter"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack "${MY_P}.tar.gz"
}

src_compile() {
	cd "${S}"
	sed -i -e '/^\$CFLAGS = ""/d' extconf.rb
	ruby extconf.rb || die
	emake || die
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc README
}
