# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

WANT_AUTOMAKE="1.10"

inherit autotools flag-o-matic

DESCRIPTION="provide high-quality remote access to QEMU virtual machine"
HOMEPAGE="http://www.spice-space.org"
SRC_URI="http://www.spice-space.org/download/${PN}_0_4.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-emulation/spice
	sys-devel/dev86
	sys-power/iasl"

RDEPEND="app-emulation/spice
	app-emulation/qemu-kvm"

S="${WORKDIR}/${PN}"

src_prepare() {
	epatch "${FILESDIR}/vdesktop-bios-fix-length.patch"
}

src_configure() {
	./configure --prefix=/usr \
		--enable-spice || die "configure failed"
}

src_compile() {
	cd ${S}/libkvm
	emake
	cd ${S}/qemu
	emake || die "emake qemu failed"
	mv x86_64-softmmu/qemu-system-x86_64 qemu-spice
	cd ${S}/bios
	emake || die "emake bios failed"
	mv BIOS-bochs-latest bios.bin
	cd ${S}/vgabios
	emake || die "emake vgabios failed"
	mv VGABIOS-lgpl-latest.cirrus.bin vgabios-cirrus.bin
	mv VGABIOS-lgpl-latest.bin vgabios.bin
}

src_install() {
	dobin qemu/qemu-spice || die
	insinto /usr/share/qemu-spice
	doins bios/bios.bin || die
	doins vgabios/vgabios.bin || die
	doins vgabios/vgabios-cirrus.bin || die
}
