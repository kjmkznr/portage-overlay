# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit font

MY_PN="NasuFont"
DESCRIPTION="Google's font family that aims to support all the world's languages"
HOMEPAGE="http://itouhiro.hatenablog.com/entry/20140917/font"
SRC_URI="mirror://sourceforge.jp/users/7/7587/${MY_PN}-${PV}.zip"

LICENSE="Apache-2.0 OFL-1.1" # Noto Sans CJK is SIL OFL 1.1, others are Apache 2.0 licensed
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="app-arch/unzip"
RESTRICT="binchecks strip"

S="${WORKDIR}/${MY_PN}${PV}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
