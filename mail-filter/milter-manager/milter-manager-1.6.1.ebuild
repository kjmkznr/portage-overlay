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
IUSE="ruby-milter"
SLOT="0"

DEPEND=">=dev-lang/ruby-1.8.5
	>=dev-util/intltool-0.37.0
	>=dev-ruby/ruby-glib2-0.16
	>=dev-libs/glib-2.12.3
	ruby-milter? ( dev-ruby/ruby-sendmail-milter )"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup milter
	enewuser milter -1 -1 /var/lib/milter milter
}

src_compile () {
	local myconf=""

	myconf="${myconf} --with-default-pid-file=/var/run/${PN}.pid"
	myconf="${myconf} --with-default-effective-user=milter"
	myconf="${myconf} --with-default-effective-group=milter"
	myconf="${myconf} --with-default-socket-group=milter"

	econf || die "econf failed"
	emake || die "emake failed"
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed"
	newinitd "${FILESDIR}/milter-manager.initd" milter-manager || die "newinitd failed"
	newconfd "${FILESDIR}/milter-manager.confd" milter-manager || die "newconfd failed"

	dodoc {README,TODO,ChangeLog} || die "dodac failed"
}
