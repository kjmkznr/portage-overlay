# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="GOPchop is a tool for losslessly cutting and merging hardware-encoded MPEG2 video files"

HOMEPAGE="http://gopchop.sourceforge.net/"
SRC_URI="mirror://sourceforge/gopchop/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="sdl X"

DEPEND=">=media-libs/libmpeg2-0.4.0
		sdl? ( media-libs/libsdl )
		X? ( >=x11-libs/gtk+-1.2 )"

src_compile() {
	local myconf
	use sdl || myconf="${myconf} --disable-sdl"
	econf ${myconf} || die "Configuration failed."
	emake || die "emake failed"
}

src_install() {
	einstall || die
}
