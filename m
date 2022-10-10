From: Vivian Wang <dramforever@live.com>
Date: Tue, 11 Oct 2022 00:33:02 +0800
Subject: [PATCH 0/3] Add Kconfig option for each extension
Message-ID: <TYYP286MB1439D0F7EA824413E8EF63FCC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for disabling SBI extensions via Kconfig. In
the future, Kconfig can also be used to disable obsolete extensions by
default.

All of the SBI extensions except Base extension is optional [1]. Users
of OpenSBI may wish to disable support for some of the extensions for
reasons such as:

- Future-proofing S-mode software, replacing SBI calls with
  new ISA functionality.
- Testing S-mode software to make sure they work correctly without
  certain extensions present.
- Disabling unused extensions to minimize the attack surface of M-mode
  software. See [2].

[1]: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#1-introduction
[2]: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/102

Vivian Wang (3):
  Makefile: Add rules for carray sources in lib/sbi
  lib: sbi_ecall: Generate extensions list with carray
  lib: sbi_ecall: Add Kconfig option for each extension

 Kconfig                       |  2 ++
 Makefile                      |  7 +++++++
 include/sbi/sbi_ecall.h       | 10 ---------
 lib/sbi/Kconfig               | 37 +++++++++++++++++++++++++++++++++
 lib/sbi/objects.mk            | 28 ++++++++++++++++++-------
 lib/sbi/sbi_ecall.c           | 39 ++++++++++-------------------------
 lib/sbi/sbi_ecall_exts.carray |  3 +++
 lib/sbi/sbi_ecall_replace.c   |  8 +++++++
 8 files changed, 89 insertions(+), 45 deletions(-)
 create mode 100644 lib/sbi/Kconfig
 create mode 100644 lib/sbi/sbi_ecall_exts.carray

-- 
2.37.1


