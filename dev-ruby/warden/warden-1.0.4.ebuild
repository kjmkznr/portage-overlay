# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_EXTRADOC="README.textile LICENSE"
inherit ruby-fakegem

DESCRIPTION="Rack middleware that provides authentication for rack applications"
HOMEPAGE="http://github.com/hassox/warden"

KEYWORDS="~amd64"
LICENSE="as-is"
SLOT="0"
IUSE="test"

RDEPEND=">=dev-ruby/rack-1.0"
DEPEND="test? ( =dev-ruby/rspec-core-2.5.1 
  =dev-ruby/rack-test-0.6.0
  =dev-ruby/rack-1.2.2 
  =dev-ruby/rspec-expectations-2.5.0
  =dev-ruby/rspec-2.5.0 )"
