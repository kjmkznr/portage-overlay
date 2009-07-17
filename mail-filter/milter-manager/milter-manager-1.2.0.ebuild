# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit eutils

DESCRIPTION="a milter to use milters effectively."
HOMEPAGE="http://milter-manager.sourceforge.net/"
SRC_URI="mirror://sourceforge/milter-manager/${P}.tar.gz"

LICENSE="GPL-3 LGPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="0"

DEPEND=">=dev-lang/ruby-1.8
	>=dev-util/intltool-0.37.0
	>=dev-ruby/ruby-glib2-0.12.3"
RDEPEND="${DEPEND}"

src_compile () {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed"
	newinitd "${FILESDIR}/milter-manager.initd" milter-manager || die "newinitd failed"
	newconfd "${FILESDIR}/milter-manager.confd" milter-manager || die "newconfd failed"

	dodoc {README,TODO,ChangeLog} || die "dodac failed"
}
