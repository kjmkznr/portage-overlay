# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-fonts/mikachan-font-ttf/mikachan-font-ttf-8.9-r2.ebuild,v 1.10 2010/08/03 16:09:11 ssuominen Exp $

inherit font

MY_PN="menma"

DESCRIPTION="menma font is anime Anohana original font"
HOMEPAGE="http://www.anohana.jp/special/font.html"
SRC_URI="http://www.anohana.jp/special/img/menma_font.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

FONT_S="${WORKDIR}"
FONT_SUFFIX="ttf"

# Only installs fonts
RESTRICT="strip binchecks"

src_install() {
	insinto /usr/share/fonts/${PN}

	cd ${WORKDIR}/menma_font
	doins menma.ttf
	newdoc readme.txt

	font_xfont_config
	font_fontconfig
}
