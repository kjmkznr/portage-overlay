# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_EXTRADOC="README"
inherit ruby-fakegem

DESCRIPTION="bcrypt-ruby provides a simple, humane wrapper for safely handling passwords."
HOMEPAGE="http://bcrypt-ruby.rubyforge.org/"

KEYWORDS="~amd64"
LICENSE="as-is"
SLOT="0"
IUSE="test"

RDEPEND="dev-ruby/rake-compiler
         dev-ruby/rspec"
