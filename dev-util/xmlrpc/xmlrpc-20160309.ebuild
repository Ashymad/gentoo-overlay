# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Commandline interface to the XML-RPC protocol."

HOMEPAGE="https://acme.com/software/xmlrpc/"

SRC_URI="https://acme.com/software/xmlrpc/xmlrpc_09Mar2016.tar.gz"

LICENSE="BSD"

SLOT="0"

KEYWORDS="amd64 ~arm ~arm64"

IUSE="ssl"

#RESTRICT="strip"

DEPEND="ssl? ( dev-libs/openssl:= )"

RDEPEND="${DEPEND}"

S=${WORKDIR}/"xmlrpc"

src_prepare() {
	default
	if use ssl; then
		epatch "${FILESDIR}"/Makefile.diff
	fi
	gawk -i inplace '{if ($1=="LDFLAGS") $3=""; print}' "${S}"/Makefile
}

src_configure() {
	:
}

src_install() {
	BINDIR="${D}"/usr/local/bin
	MANDIR="${D}"/usr/share/man/man1
	install -d "${BINDIR}" "${MANDIR}"

	emake \
		BINDIR="${BINDIR}" \
		MANDIR="${MANDIR}" \
		install
}
