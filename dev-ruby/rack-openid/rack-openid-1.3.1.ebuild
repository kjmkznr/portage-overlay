# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_EXTRADOC="README.rdoc LICENSE"
inherit ruby-fakegem

DESCRIPTION="Provides a more HTTPish API around the ruby-openid library"
HOMEPAGE="http://github.com/josh/rack-openid"

KEYWORDS="~amd64"
LICENSE="as-is"
SLOT="0"
IUSE="test"

RDEPEND=">=dev-ruby/rack-1.1.0
		 >=dev-ruby/ruby-openid-2.1.8"
