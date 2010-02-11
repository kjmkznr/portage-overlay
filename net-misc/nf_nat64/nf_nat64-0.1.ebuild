# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs linux-mod

SRC_URI="http://ecdysis.viagenie.ca/download/nf_nat64-0.1.tar.bz2"
KEYWORDS="~amd64"

DESCRIPTION="NAT64 Linux Kernel Module"
HOMEPAGE="http://ecdysis.viagenie.ca/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=virtual/linux-sources-2.6.33"
DEPEND="${RDEPEND}"

BUILD_TARGETS="modules"
MODULE_NAMES="nf_nat64(kernel/net/netfilter/)"
S="${WORKDIR}/${PN}"

pkg_setup() {
	if use kernel_linux && kernel_is lt 2 6 33; then
		echo
		ewarn "Your kernel version is ${KV_MAJOR}.${KV_MINOR},${KV_PATCH}"
		ewarn "It is recommended that you upgrade your kernel to a version >= 2.6.33"
		echo
	fi
	linux-mod_pkg_setup
	BUILD_PARAMS="-C ${KV_DIR} M=${S}"
}


