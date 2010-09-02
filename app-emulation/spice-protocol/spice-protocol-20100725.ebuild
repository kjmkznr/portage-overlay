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
#EGIT_COMMIT="3bc42870d020c8dc6804f1f3c6b0da9d7d6193a9"
#EGIT_COMMIT="b25441f26b968fa787cb615aad383f6b7947b434"
# 2010/07/25
EGIT_COMMIT="03498833d73175ed325ba92fb339852bd24b320f"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
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
