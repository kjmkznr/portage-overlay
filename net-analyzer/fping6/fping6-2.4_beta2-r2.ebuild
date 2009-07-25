# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/fping/fping-2.4_beta2-r2.ebuild,v 1.8 2009/02/04 21:08:49 armin76 Exp $

DESCRIPTION="A utility to ping multiple hosts at once"
SRC_URI="http://unfix.org/projects/ipv6/fping-2.4b2_to-ipv6.tar.gz"
HOMEPAGE="http://www.fping.com/"

SLOT="0"
LICENSE="fping"
KEYWORDS="amd64"
IUSE=""

S="${WORKDIR}/fping-2.4b2_to-ipv6"

src_compile () {
	cd "${S}"
	econf || die "Failed econf"
	emake || die "Failed emake"
}

src_install () {
	dosbin fping6 || die "Failed to install fping."
	fperms 4555 /usr/sbin/fping6
	doman fping6.8
	dodoc ChangeLog README
}
