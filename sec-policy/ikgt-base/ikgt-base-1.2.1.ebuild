#
# Copyright (c) 2015 CoreOS, Inc.. All rights reserved.
# Distributed under the terms of the GNU General Public License v2
# $Header:$
#

EAPI=6

DESCRIPTION="Intel Kernel Guard Technology"
HOMEPAGE="https://01.org/intel-kgt"
SRC_URI="https://01.org/sites/default/files/downloads/intel-kgt/ikgtsrc.1.2.1.tar.gz"

SLOT="0"
KEYWORDS="amd64 arm64"
IUSE=""

S="${WORKDIR}"

src_prepare() {
			  sed -i '/$(MAKE) -C $(PWD)\/driver/d' example-usage/integrity/Makefile
			  eapply_user
}

src_compile() {
			  cd example-usage/integrity
			  make
}

src_install() {
			  insinto /usr/boot
			  doins xmon/bin/linux/release/ikgt_pkg.bin
}
