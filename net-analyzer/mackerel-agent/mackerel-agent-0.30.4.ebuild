# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit golang-build user

KEYWORDS="~amd64"
DESCRIPTION="Agent for mackerel.io"
HOMEPAGE="https://mackerel.io/"
GO_PN="github.com/mackerelio/${PN}"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
RESTRICT="test"

DEPEND=""
RDEPEND=""

SRC_URI="https://${GO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
STRIP_MASK="*.a"
S="${WORKDIR}/src/${GO_PN}"

GIT_COMMIT="f0b3976"
AGENT_USER_GROUP="mackerel"

pkg_setup() {
	enewgroup ${AGENT_USER_GROUP}
	enewuser ${AGENT_USER_GROUP} -1 -1 -1 ${AGENT_USER_GROUP}
}

src_unpack() {
	local x

	default
	mkdir -p src/${GO_PN%/*} || die
	mv ${P} src/${GO_PN} || die

	export GOPATH=${WORKDIR}:$(get_golibdir_gopath)

	# Create a writable GOROOT in order to avoid sandbox violations.
	export GOROOT="${WORKDIR}/goroot"
	cp -sR "${EPREFIX}"/usr/lib/go "${GOROOT}" || die
	rm -rf "${GOROOT}/src/${GO_PN}" || die
}

src_prepare() {
	sed -e "s:GITCOMMIT=.*\s:GITCOMMIT=${GIT_COMMIT}:" \
		-i Makefile || die
}

src_compile() {
	export MACKEREL_AGENT_VERSION=${PV}
	PATH=${GOROOT}/bin:${PATH} emake build
}

src_install() {
	local x

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"

	keepdir /var/lib/${PN}
	keepdir /etc/${PN}
	insinto /etc/${PN}
	newins "${WORKDIR}/src/${GO_PN}/mackerel-agent.sample.conf" "mackerel-agent.conf"

	dobin "${WORKDIR}/src/${GO_PN}/build/mackerel-agent"
}
