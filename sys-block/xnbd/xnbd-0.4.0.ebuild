# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools
inherit eutils

DESCRIPTION="Yet another NBD (Network Block Device) server program"
HOMEPAGE="https://bitbucket.org/hirofuchi/xnbd/wiki/Home"
SRC_URI="https://bitbucket.org/hirofuchi/xnbd/downloads/xnbd-0.4.0.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

DEPEND="dev-libs/jansson:*
		dev-libs/glib:*"

RDEPEND="${DEPEND}
		app-text/asciidoc"

S=${WORKDIR}/${P}/trunk

src_prepare() {
	eapply_user
	epatch "${FILESDIR}"/00include_sysmacros.patch
	eautoreconf
}
