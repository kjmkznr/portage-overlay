# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

WANT_AUTOMAKE="1.10"

inherit autotools git

DESCRIPTION="Spice protocol headers"
HOMEPAGE="http://www.spice-space.org"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="git://anongit.freedesktop.org/spice/spice-protocol"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-util/pkgconfig
	sys-devel/libtool
	>=sys-devel/gcc-4.1"

RDEPEND=""

S="${WORKDIR}/${PN}"

src_unpack() {
	git_src_unpack
	cd "${S}"
}

src_prepare() {
	eautoreconf || die
}
src_install() {
	emake DESTDIR="${D}" install || die
}
