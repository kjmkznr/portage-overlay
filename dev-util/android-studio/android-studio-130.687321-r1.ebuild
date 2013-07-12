# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

RESTRICT="strip"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

PATCH="130.709792"
DESCRIPTION="A new Android development environment based on IntelliJ IDEA"
HOMEPAGE="http://jetbrains.com/idea/"
SRC_URI="http://dl.google.com/android/studio/${PN}-bundle-${PV}-linux.tgz
http://dl-sdk.appspot.com/as/patches/AI-${PV}-${PATCH}-patch-unix.jar"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
KEYWORDS="~x86 ~amd64"

RDEPEND=">=virtual/jdk-1.6"
S=${WORKDIR}/${PN}
MY_PN="studio"

src_install() {
	local dir="/opt/${P}"
	local exe="${PN}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}/bin/studio.sh" "${dir}/bin/fsnotifier" "${dir}/bin/fsnotifier64"

	java -classpath "${DISTDIR}/AI-${PV}-${PATCH}-patch-unix.jar" com.intellij.updater.Runner install "${S}" 
	if [ "$?" != "42" ]; then
		die "Update process failed with code: ${ret}"
	fi

	newicon "bin/idea.png" "${exe}.png"
	make_wrapper "${exe}" "/opt/${P}/bin/${MY_PN}.sh"
	make_desktop_entry ${exe} "Android Stuio" "${exe}" "Development;IDE"
}
