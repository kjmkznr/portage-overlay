# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils autotools

MY_P="${PN}-cvs-${PV}"
DESCRIPTION="scamper is a program that is able to conduct Internet measurement tasks to large numbers of IPv4 and IPv6 addresses, in parallel, to fill a specified packets-per-second rate."
HOMEPAGE="http://www.wand.net.nz/scamper/"
SRC_URI="http://www.wand.net.nz/scamper/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

S="${WORKDIR}/${MY_P}"

src_prepare() {
	cd "${S}"

	mv Makefile.gnu Makefile
}

src_compile() {
	cd ${S}
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"|| die
}

src_install() {
	dobin scamper
	dobin sc_analysis_dump
	dobin warts-cat
	dobin warts-dump
	dobin warts2traceroute
}
