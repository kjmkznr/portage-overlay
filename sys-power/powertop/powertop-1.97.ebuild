# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs eutils

DESCRIPTION="tool that helps you find what software is using the most power"
HOMEPAGE="http://www.lesswatts.org/projects/powertop/"
SRC_URI="http://www.kernel.org/pub/linux/status/powertop/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="unicode"

DEPEND="sys-libs/ncurses[unicode?]
	sys-devel/gettext"
RDEPEND="${DEPEND}
	sys-apps/pciutils"

src_prepare() {
	sed -i '/${CFLAGS}/s:$: ${LDFLAGS}:' Makefile
	use unicode || sed -i 's:-lncursesw:-lncurses:' Makefile
}

src_configure() {
	tc-export CC
}

src_install() {
	emake install DESTDIR="${ED}" || die
	dodoc Changelog README
	gunzip "${ED}"/usr/share/man/man1/powertop.1.gz
}

pkg_postinst() {
	echo
	einfo "For PowerTOP to work best, use a Linux kernel with the"
	einfo "tickless idle (NO_HZ) feature enabled (version 2.6.21 or later)"
	echo
}