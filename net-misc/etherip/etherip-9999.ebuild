# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs git linux-mod

EGIT_REPO_URI="git://github.com/kjmkznr/etherip.git"
SRC_URI=""
KEYWORDS="~amd64"

DESCRIPTION="EtherIP Linux Kernel Module"
HOMEPAGE="http://github.com/kjmkznr/etherip/tree/master"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=virtual/linux-sources-2.6.29"
DEPEND="${RDEPEND}"

BUILD_TARGETS="modules"
MODULE_NAMES="etherip(kernel/net/ipv4)"

pkg_setup() {
	if use kernel_linux && kernel_is lt 2 6 24; then
		echo
		ewarn "Your kernel version is ${KV_MAJOR}.${KV_MINOR},${KV_PATCH}"
		ewarn "It is recommended that you upgrade your kernel to a version >= 2.6.24"
		echo
	fi
	linux-mod_pkg_setup
	BUILD_PARAMS="-C ${KV_DIR} M=${S}"
}

src_unpack() {
	git_src_unpack
}

