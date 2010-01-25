# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

DESCRIPTION="PyBindGen is a Python bindings generator"
HOMEPAGE="http://code.google.com/p/pybindgen/"
SRC_URI="http://launchpad.net/pybindgen/trunk/0.13/+download/${P}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"

src_configure() {
	./waf --prefix "/usr" configure \
				|| die "./waf configure failed"
}

src_compile() {
	./waf build ${NUMJOBS} || die "./waf build failed"
}

src_install(){
	./waf --destdir="${D}" install || die "./waf install failed"
}
