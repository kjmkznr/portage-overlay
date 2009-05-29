# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

DESCRIPTION="a two pane file manager under UNIX console."
HOMEPAGE="http://www.geocities.jp/daisuke530221jp/index3.html"
SRC_URI="http://www.geocities.jp/daisuke530221jp/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk"
RESTRICT="mirror strip"

COMMON_DEPEND="!app-misc/mfiler2
	>=sys-libs/ncurses-5
	dev-libs/boehm-gc
	dev-libs/libtar
	>=app-text/cmigemo-1.3
	>=dev-lang/ruby-1.8.6_p287
	>=dev-libs/oniguruma-4.6.1"
RDEPEND="${COMMON_DEPEND}
	gtk? ( >=dev-ruby/ruby-gtk2-0.15.0 )"
DEPEND="${COMMON_DEPEND}"
S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# don't install mdnd if "gtk" USE flag is disabled
	use gtk || sed -i 's:$(INSTALL) -m 755 mdnd $(bindir)::' Makefile.in
}

src_compile() {
	export CC="$(tc-getCC) ${CFLAGS}"
	econf --sysconfdir=/etc/mfiler3 || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall sysconfdir="${D}"/etc/mfiler3 || die "einstall failed"
	dodoc doc/{AUTHORS,GPL,TODO,PROGRAMING_PHILOSOPHY,*.jpg} || die "dodoc failed"
	dohtml doc/*.html || die "dohtml failed"
}
