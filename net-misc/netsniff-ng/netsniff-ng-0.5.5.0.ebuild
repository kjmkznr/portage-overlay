# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="high performance network sniffer for packet inspection"
HOMEPAGE="http://www.netsniff-ng.org/"
SRC_URI="http://www.netsniff-ng.org/pub/netsniff-ng/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="mirror"
S="${WORKDIR}/${PN}/src/"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	emake || die
}

src_install() {
	dobin netsniff-ng
	dodoc man/netsniff-ng.txt
	insinto /etc/netsniff-ng/rules/
	doins rules/* || die
}
