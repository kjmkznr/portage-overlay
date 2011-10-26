# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit java-pkg-2

MY_P="selenium-server-standalone-${PV}"

DESCRIPTION="Web application testing toolkit utilizing remote-control of a web browser"
HOMEPAGE="http://seleniumhq.org/"
SRC_URI="http://selenium.googlecode.com/files/${MY_P}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jre-1.5"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	mkdir "${S}"
	cp "${DISTDIR}/${MY_P}.jar" "${S}"
}

src_install() {
	java-pkg_newjar ${MY_P}.jar
	java-pkg_dolauncher
}

pkg_postinst() {
	einfo "You will need a browser that selenium remote control can"
	einfo "start and run tests. The list of supported browsers can"
	einfo "be found here:"
	einfo "http://seleniumhq.org/about/platforms.html#browsers"
	einfo ""
	einfo "Note that you must start selenium remote control within"
	einfo "an X session of the user you intend run selenium scripts on."
	einfo ""
	einfo "You can use /usr/bin/selenium-remote-control-bin to start the"
	einfo "selenium remote control."
}
