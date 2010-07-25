# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

WANT_AUTOMAKE="1.10"

inherit autotools flag-o-matic

DESCRIPTION="provide high-quality remote access to QEMU virtual machine"
HOMEPAGE="http://www.spice-space.org"
SRC_URI="http://www.spice-space.org/download/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

COMMON_DEP="dev-libs/log4cpp
	x11-libs/qcairo[X,opengl]
	>=media-libs/celt-0.6
	media-video/ffmpeg
	media-libs/alsa-lib
	dev-libs/openssl
	virtual/glu
	>=x11-libs/libXrandr-1.2
	>=sys-devel/gcc-4.1"
DEPEND="${COMMON_DEP}
	dev-util/pkgconfig
	sys-devel/libtool"

RDEPEND="${COMMON_DEP}"

S="${WORKDIR}/${PN}"

src_prepare() {
	epatch "${FILESDIR}"/use_pkconfig.patch || die "epatch failed"
	epatch "${FILESDIR}"/gentoo_header_name.diff || die "epatch failed"
	epatch "${FILESDIR}"/celt-0.7.1.patch || die "epatch failed"
	epatch "${FILESDIR}"/remove-info-image.patch || die "epatch failed"
	append-flags -D__STDC_CONSTANT_MACROS
	append-ldflags -lcelt0
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
}
