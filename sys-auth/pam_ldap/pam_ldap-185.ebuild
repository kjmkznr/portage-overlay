# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/pam_ldap/pam_ldap-184.ebuild,v 1.2 2007/11/07 17:52:53 armin76 Exp $

WANT_AUTOCONF="latest"
WANT_AUTOMAKE="latest"

inherit eutils pam autotools

DESCRIPTION="PAM LDAP Module"
HOMEPAGE="http://www.padl.com/OSS/pam_ldap.html"
SRC_URI="http://www.padl.com/download/${P}.tar.gz"

LICENSE="|| ( GPL-2 LGPL-2 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86"
IUSE="ssl sasl ipv6"
DEPEND=">=sys-libs/glibc-2.1.3
		>=sys-libs/pam-0.72
		>=net-nds/openldap-2.1.30-r5
		sasl? ( dev-libs/cyrus-sasl )"

src_unpack() {
	unpack ${A}

	if use ipv6; then
		EPATCH_OPTS="-p1 -d ${S}" epatch "${FILESDIR}/${P}-support-ipv6.patch"
	fi

	EPATCH_OPTS="-p1 -d ${S}" epatch "${FILESDIR}/${P}-vers_string.patch"
	cd "${S}"
	eautoreconf
}

src_compile() {
	econf --with-ldap-lib=openldap `use_enable ssl` || die
	emake || die
}

src_install() {
	dopammod pam_ldap.so

	dodoc pam.conf ldap.conf ldapns.schema chsh chfn certutil
	dodoc ChangeLog CVSVersionInfo.txt README AUTHORS ns-pwd-policy.schema
	doman pam_ldap.5

	docinto pam.d
	dodoc pam.d/*
}
