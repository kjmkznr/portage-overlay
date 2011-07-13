# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_EXTRADOC="README COPYING"
inherit ruby-fakegem

DESCRIPTION="rQRCode is a library for encoding QR Codes."
HOMEPAGE="http://whomwah.github.com/rqrcode/"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"
IUSE="test"

