# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )
inherit distutils-r1

DESCRIPTION="Universal Command Line Interface for Amazon Web Services"
HOMEPAGE="https://github.com/aws/aws-cli"
SRC_URI="https://github.com/aws/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/bcdoc[${PYTHON_USEDEP}]
	=dev-python/botocore-0.76*[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/rsa[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

src_prepare() {
	# unbundle requests https://github.com/boto/botocore/issues/266
	rm -Rf botocore/vendored || die "rm failed"
	grep -rl 'botocore.vendored' | xargs \
		sed -i -e "/import requests/s/from botocore.vendored //" \
		-e "/^from/s/botocore.vendored.//" \
		-e "s/'botocore.vendored./'/" \
		|| die "sed failed"
}

python_test() {
	# Only run unit tests
	nosetests tests/unit || die "Tests fail with ${EPYTHON}"
}

