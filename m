From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 18 Jan 2023 15:42:23 +0100
Subject: [PATCH 00/11] SBI system suspend (SUSP) extension
Message-ID: <20230118144234.79263-1-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series implements the SBI system suspend support in OpenSBI
as-per the draft proposal for SBI system suspend which can be found at
https://github.com/jones-drew/riscv-sbi-doc/commit/d9e43e9a938fc3eb510e023c3f352462876f7785

The first half of the series are a few cleanups and fixes for HSM,
as system suspend makes use of some of its code and patterns. The
second half implements support for the extension and includes a patch
which allows testing to be enabled, even when low-level firmware does
not provide support. Regarding the test mode, it's currently enabled
by adding a 'system-suspend-test' DT property, but Anup has suggested
that FW_OPTION could also be used. I'm all ears for what people think
the best way to control test functionality in OpenSBI is and am happy
to switch it. To test with Linux the kernel must include the patch at
https://github.com/jones-drew/linux/commits/riscv/sbi-susp-rfc and
be built with CONFIG_SUSPEND enabled.

The patches are based on commit da5594bf853d ("platform: generic:
allwinner: Fix PLIC array bounds") and can also be found at
https://github.com/jones-drew/opensbi/commits/susp-v1

v2:
 - Rebased on latest master
 - Added a print line to sbi_boot_print_general() [Anup]
 - Picked up Anup's r-b's

Andrew Jones (11):
  lib: sbi_hsm: Factor out invalid state detection
  lib: sbi_hsm: Don't try to restore state on failed change
  lib: sbi_hsm: Ensure errors are consistent with spec
  lib: sbi_hsm: Move misplaced comment
  lib: sbi_hsm: Remove unnecessary include
  lib: sbi_hsm: Export some functions
  lib: sbi: Add system suspend skeleton
  lib: sbi: Add system_suspend_allowed domain property
  lib: sbi: Implement system suspend
  docs: Correct opensbi-domain property name
  platform: generic: Add system suspend test

 docs/domain_support.md            |  15 +++-
 include/sbi/sbi_domain.h          |   2 +
 include/sbi/sbi_ecall_interface.h |   8 +++
 include/sbi/sbi_hsm.h             |   4 ++
 include/sbi/sbi_system.h          |  18 +++++
 lib/sbi/Kconfig                   |   4 ++
 lib/sbi/objects.mk                |   3 +
 lib/sbi/sbi_domain.c              |   4 ++
 lib/sbi/sbi_ecall_hsm.c           |   4 +-
 lib/sbi/sbi_ecall_susp.c          |  48 +++++++++++++
 lib/sbi/sbi_hsm.c                 |  92 +++++++++++--------------
 lib/sbi/sbi_init.c                |   4 ++
 lib/sbi/sbi_system.c              | 111 ++++++++++++++++++++++++++++++
 lib/utils/fdt/fdt_domain.c        |   7 ++
 platform/generic/platform.c       |  20 +++++-
 15 files changed, 287 insertions(+), 57 deletions(-)
 create mode 100644 lib/sbi/sbi_ecall_susp.c

-- 
2.39.0


