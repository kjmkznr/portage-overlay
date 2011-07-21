# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/flexmock/flexmock-0.8.0.ebuild,v 1.1 2008/05/17 12:58:04 graaff Exp $

EAPI=3

USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC="yard"
RUBY_FAKEGEM_DOCDIR="doc"

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRADOC="README.markdown"

# We normally don't install specs, but other do_ packages depend on
# these files being here to run their own specs.
RUBY_FAKEGEM_EXTRAINSTALL="spec"

inherit ruby-fakegem

DESCRIPTION="The Core DataObjects class"
HOMEPAGE="http://rubyforge.org/projects/dorb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/jeweler >=dev-ruby/yard-0.5 )"
ruby_add_bdepend "test? ( dev-ruby/jeweler >=dev-ruby/bacon-1.1 >=dev-ruby/mocha-0.9 )"

ruby_add_rdepend ">=dev-ruby/addressable-2.1"
