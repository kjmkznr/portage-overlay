# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils versionator

DESCRIPTION="JavaScript IDE for client- and server-side development with Node.js"
HOMEPAGE="http://www.jetbrains.com/webstorm"
SRC_URI="http://download.jetbrains.com/webstorm/WebStorm-$(get_version_component_range 1-3).tar.gz"

LICENSE="|| ( JetBrains-business JetBrains-classroom JetBrains-educational JetBrains-individual )
        Apache-2.0
        BSD
        CC0-1.0
        CDDL
        CDDL-1.1
        EPL-1.0
        GPL-2
        GPL-2-with-classpath-exception
        ISC
        LGPL-2.1
        LGPL-3
        MIT
        MPL-1.1
        OFL
        ZLIB
"
SLOT=0

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/jdk"

BUILD_NUMBER="201.7223.93"
S="${WORKDIR}/WebStorm-${BUILD_NUMBER}"

src_install() {
	local dir="/opt/${P}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}"/bin/{${PN}.sh,fsnotifier{,64}}
	fperms 755 "${dir}"/jbr/bin/{jaotc,java,javac,jdb,jfr,jhsdb,jjs,jrunscript,keytool,pack200,rmid,rmiregistry,serialver,unpack200}

	make_wrapper "${PN}" "${dir}/bin/${PN}.sh"
	newicon "bin/${PN}.png" "${PN}.png"
	make_desktop_entry "${PN}" "${PN}" "${PN}" "Development;IDE;"
}
