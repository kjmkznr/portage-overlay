# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy )

inherit distutils-r1

DESCRIPTION="Google Drive API made easy."
HOMEPAGE="https://pypi.python.org/pypi/PyDrive"
SRC_URI="http://pypi.python.org/packages/source/P/PyDrive/PyDrive-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-3.0[${PYTHON_USEDEP}]
		>=dev-python/google-api-python-client-1.2[${PYTHON_USEDEP}]"


python_test() {
   "${PYTHON}" setup.py test || die
}

python_install_all() {
	distutils-r1_python_install_all
}
