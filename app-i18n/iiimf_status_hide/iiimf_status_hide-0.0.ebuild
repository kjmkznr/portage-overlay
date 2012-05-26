# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Hide IIIMF status tool."
HOMEPAGE="http://support.justsystems.com/faq/1032/app/servlet/qadoc?QID=037494"
SRC_URI="http://www3.justsystem.co.jp/download/atok/ut/lin/iiimf_status_hide.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${PN}.gz" "${S}"
	unpack ${PN}.gz
}

src_install() {
	dobin ${PN}
}
