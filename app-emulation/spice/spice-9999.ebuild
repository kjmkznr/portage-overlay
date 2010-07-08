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
EGIT_COMMIT="4f54596e0113c0692c10cfc1c25400c8070d67b3"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="opengl gui"

DEPEND="dev-util/pkgconfig
	sys-devel/libtool
	dev-python/pyparsing
	<dev-lang/python-3
	gui? ( =dev-games/cegui-0.6*[opengl] )
	>=x11-libs/pixman-0.17.2
	>=sys-devel/gcc-4.1"

RDEPEND=">=x11-libs/pixman-0.17.2"

S="${WORKDIR}/${PN}"

src_unpack() {
	git_src_unpack
	cd "${S}"
}

src_prepare() {
	epatch "${FILESDIR}"/spice-9999-20100707-use_pkconfig.patch || die "epatch failed"
	epatch "${FILESDIR}"/spice-9999-20100707-celt-0.7.1.patch || die "epatch failed"
	epatch "${FILESDIR}"/spice-9999-20100707-spice.proto.patch || die "epatch failed"
	if use opengl ; then
		epatch "${FILESDIR}"/spice-9999-20100707-use-opengl.patch || die "epatch failed"
	fi
	eautoreconf || die
}

src_compile() {
	append-ldflags -lcelt0
	if use opengl ; then
		myconf="--enable-opengl"
	fi
	if use gui ; then
		myconf="--enable-gui"
		econf ${myconf} || die
		emake || die
	else
		cd "${S}/server"
		emake || die
	fi
}

src_install() {
	if ! use gui ; then
		cd "${S}/server"
	fi
	emake DESTDIR="${D}" install || die
}
