inherit eutils toolchain-funcs

DESCRIPTION="PaSoRi Access Library"
HOMEPAGE="http://homepage3.nifty.com/slokar/pasori/libpafe.html"
SRC_URI="http://homepage3.nifty.com/slokar/pasori/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND=""

src_unpack() {
	     unpack ${A}
	     cd "${S}"
}

src_compile() {
	      econf || die "econf failed"
	      emake || die "emake failed"
}

src_install() {
	      einstall || die "einstall failed"

	      insinto /etc/udev/rules.d
	      doins "${FILESDIR}"/10-pasori.rules || die "doins failed"
}

