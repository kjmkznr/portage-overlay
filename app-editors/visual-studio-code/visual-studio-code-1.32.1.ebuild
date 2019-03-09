# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

RELEASE_CHANNEL="stable"
BINARY_SUFFIX=""

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="
	amd64? ( https://vscode-update.azurewebsites.net/${PV}/linux-x64/${RELEASE_CHANNEL} -> VSCode-linux-${PVR}-x64.tar.gz )
	x86? ( https://vscode-update.azurewebsites.net/${PV}/linux-ia32/${RELEASE_CHANNEL} -> VSCode-linux-${PVR}-ia32.tar.gz )
"

LICENSE="Microsoft"
SLOT=${RELEASE_CHANNEL}
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="strip mirror"

QA_PREBUILT="opt/${PN}-${SLOT}/code${BINARY_SUFFIX}"

DEPEND="
	>=media-libs/libpng-1.2.46
	>=x11-libs/gtk+-2.24.8-r1:2
	gnome-base/gconf
"
RDEPEND="${DEPEND}
	net-print/cups
"

S="${WORKDIR}/VSCode-linux-x64"

src_install() {
	insinto "/opt/${PN}-${SLOT}"
	doins -r *
	dosym "/opt/${PN}-${SLOT}/code${BINARY_SUFFIX}" "/usr/bin/visual-studio-code${BINARY_SUFFIX}"
	insinto "/usr/share/applications"
	doins ${FILESDIR}/${PN}-${SLOT}.desktop
	insinto "/usr/share/pixmaps"
	doins ${FILESDIR}/${PN}-${SLOT}.png
	fperms +x "/opt/${PN}-${SLOT}/code${BINARY_SUFFIX}"
}

pkg_postinst() {
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
