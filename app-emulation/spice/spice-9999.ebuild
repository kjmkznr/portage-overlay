# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

WANT_AUTOMAKE="1.10"

inherit autotools git flag-o-matic

DESCRIPTION="provide high-quality remote access to QEMU virtual machine"
HOMEPAGE="http://www.spice-space.org"
SRC_URI=""
EGIT_BRANCH="master"
#EGIT_REPO_URI="git://anongit.freedesktop.org/~kraxel/spice"
EGIT_REPO_URI="git://git.freedesktop.org/git/spice/spice"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-util/pkgconfig
	sys-devel/libtool
	dev-python/pyparsing
	<dev-lang/python-3
	=dev-games/cegui-0.6*
	>=x11-libs/pixman-0.17.2
	>=sys-devel/gcc-4.1"

RDEPEND=""

S="${WORKDIR}/${PN}"

src_unpack() {
	git_src_unpack
	cd "${S}"
}

src_prepare() {
	epatch "${FILESDIR}"/spice-9999-20100707-use_pkconfig.patch || die "epatch failed"
	epatch "${FILESDIR}"/spice-9999-20100707-celt-0.7.1.patch || die "epatch failed"
	epatch "${FILESDIR}"/spice-9999-20100707-spice.proto.patch || die "epatch failed"
	append-ldflags -lcelt0
	eautoreconf || die
}
src_install() {
	emake DESTDIR="${D}" install || die
}
