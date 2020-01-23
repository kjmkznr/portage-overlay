# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils versionator

DESCRIPTION="JavaScript IDE for client- and server-side development with Node.js"
HOMEPAGE="http://www.jetbrains.com/webstorm"
SRC_URI="http://download.jetbrains.com/webstorm/WebStorm-$(get_version_component_range 1-3).tar.gz"

LICENSE="IDEA
	|| ( IDEA_Academic IDEA_Classroom IDEA_OpenSource IDEA_Personal )"

SLOT=0

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/jdk"

S="${WORKDIR}/WebStorm-$(get_version_component_range 4-6)"

src_install() {
	local dir="/opt/$(get_version_component_range 1-3)"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}"/bin/{${PN}.sh,fsnotifier{,64}}

	make_wrapper "${PN}" "${dir}/bin/${PN}.sh"
	newicon "bin/${PN}.png" "${PN}.png"
	make_desktop_entry "${PN}" "${PN}" "${PN}" "Development;IDE;"
}