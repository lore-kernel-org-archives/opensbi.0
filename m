From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 27 Feb 2023 11:30:55 +0100
Subject: [PATCH v2 00/11] SBI system suspend (SUSP) extension
Message-ID: <20230227103106.137995-1-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series implements the SBI system suspend support in OpenSBI
as-per the draft proposal for SBI system suspend which can be found at
https://github.com/jones-drew/riscv-sbi-doc/commit/39fbea947468e85b0ba92626477747ac7a27b91f

The first half of the series are a few cleanups and fixes for HSM,
as system suspend makes use of some of its code and patterns. The
second half implements support for the extension and includes a patch
which allows testing to be enabled, even when low-level firmware does
not provide support. Regarding the test mode, it's currently enabled
by adding a 'system-suspend-test' DT property, but Anup has suggested
that FW_OPTION could also be used. I'm all ears for what people think
the best way to control test functionality in OpenSBI is and am happy
to switch it. To test with Linux, the kernel must include the patch at
https://github.com/jones-drew/linux/commits/riscv/sbi-susp-rfc and
be built with CONFIG_SUSPEND enabled.

These patches may also be found at
https://github.com/jones-drew/opensbi/commits/susp-v2

v2:
 - Rebased on latest master
 - Added warmboot_addr parameter to platform suspend device's
   system_suspend call. This was suggested by Anup, as not all
   platforms can easily return from this call. These platforms
   may now opt to jump to the warmboot address directly. I kept
   Anup's r-b's since the change is minor and he suggested it.
   Note, the parameter is for convenience and to make the code
   more self-documenting, as a platform could fish the warmboot
   address out of scratch itself.

v1 (changes since RFC):
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
 include/sbi/sbi_system.h          |  27 +++++++
 lib/sbi/Kconfig                   |   4 ++
 lib/sbi/objects.mk                |   3 +
 lib/sbi/sbi_domain.c              |   4 ++
 lib/sbi/sbi_ecall_hsm.c           |   4 +-
 lib/sbi/sbi_ecall_susp.c          |  48 +++++++++++++
 lib/sbi/sbi_hsm.c                 |  92 +++++++++++-------------
 lib/sbi/sbi_init.c                |   4 ++
 lib/sbi/sbi_system.c              | 112 ++++++++++++++++++++++++++++++
 lib/utils/fdt/fdt_domain.c        |   7 ++
 platform/generic/platform.c       |  20 +++++-
 15 files changed, 297 insertions(+), 57 deletions(-)
 create mode 100644 lib/sbi/sbi_ecall_susp.c

-- 
2.39.1


