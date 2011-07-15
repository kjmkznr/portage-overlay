# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_EXTRADOC="README.md"
inherit ruby-fakegem

DESCRIPTION="Client library and command-line tool to manage and deploy Rails apps on Heroku."
HOMEPAGE="http://heroku.com/"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"
IUSE="test"

RDEPEND=">=dev-ruby/launchy-0.3.2
		=dev-ruby/rest-client-1.6.1
		=dev-ruby/term-ansicolor-1.0.5*
		app-misc/ca-certificates"

all_ruby_prepare() {
	epatch "${FILESDIR}/ca-certificates.patch" || die
}
