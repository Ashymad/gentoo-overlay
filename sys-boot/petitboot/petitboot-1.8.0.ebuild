# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="A kexec-based bootloader."
HOMEPAGE="http://git.ozlabs.org/?p=petitboot"
SRC_URI="https://github.com/open-power/petitboot/releases/download/v1.8.0/petitboot-1.8.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

DEPEND="sys-fs/lvm2:*"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
