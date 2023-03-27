From: Sunil V L <sunilvl@ventanamicro.com>
Date: Mon, 27 Mar 2023 16:37:15 +0530
Subject: [RFC PATCH v3 0/4] Add CPPC extension support in OpenSBI
Message-ID: <20230327110719.1806244-1-sunilvl@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest proposal of SBI CPPC extension can be found at:
https://lists.riscv.org/g/tech-prs/message/301

This series implements SBI CPPC extension support in OpenSBI
as-per above draft proposal.

To test these patches,
Qemu patches can be found in,
aia_plic_cppc_v1 branch at: https://github.com/vlsunil/qemu.git
Linux patches can be found in
aia_plic_cppc_v1 branch at: https://github.com/vlsunil/linux.git

These OpenSBI patches can also be found in
aia_plic_cppc_v3 branch at: https://github.com/vlsunil/opensbi.git

Changes since v2:
	1) Updated probe, read/write functions as per Drew's feedback to split between
	   common and platform specific functions.

Changes since v1:
	1) Addresses Drew's feedback
		a) Updated common functions to handle most of the errors.
		b) Added is_reserved, readable, writable helpers as per Drew's feedback.
		c) Updated macro name to SBI_CPPC_ENERGY_PERF_PREFERENCE
	2) Updated RB tags


Sunil V L (4):
  include: Add defines for SBI CPPC extension
  lib: sbi: Implement SBI CPPC extension
  lib: sbi: Print the CPPC device name
  NOT_FOR_MERGE: Add test code to emulate CPPC extension

 include/sbi/sbi_cppc.h            |  37 ++++++
 include/sbi/sbi_ecall_interface.h |  34 ++++++
 lib/sbi/Kconfig                   |   4 +
 lib/sbi/objects.mk                |   4 +
 lib/sbi/sbi_cppc.c                | 156 ++++++++++++++++++++++++
 lib/sbi/sbi_ecall_cppc.c          |  63 ++++++++++
 lib/sbi/sbi_init.c                |   5 +
 platform/generic/objects.mk       |   1 +
 platform/generic/platform.c       |   6 +
 platform/generic/test_cppc.c      | 196 ++++++++++++++++++++++++++++++
 10 files changed, 506 insertions(+)
 create mode 100644 include/sbi/sbi_cppc.h
 create mode 100644 lib/sbi/sbi_cppc.c
 create mode 100644 lib/sbi/sbi_ecall_cppc.c
 create mode 100644 platform/generic/test_cppc.c

-- 
2.34.1


