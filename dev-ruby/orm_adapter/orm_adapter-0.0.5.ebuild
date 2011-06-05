# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
inherit ruby-fakegem

DESCRIPTION="Provides a single point of entry for using basic features of ruby ORMs"
HOMEPAGE="http://github.com/ianwhite/orm_adapter"

KEYWORDS="~amd64"
LICENSE="as-is"
SLOT="0"
IUSE="test"

RDEPEND=">=dev-ruby/yard-0.6.0
         >=dev-ruby/ruby-git-1.2.5"
