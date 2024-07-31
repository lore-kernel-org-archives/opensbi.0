From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 31 Jul 2024 11:16:21 -0700
Subject: [PATCH 0/8] Prepare memregion handling for future isolation primitives
Message-ID: <20240731181629.269898-1-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The existing memregion handling code deeply embeds the assumption that we will
be isolating domains using PMP/SMEPMP rather than another isolation primitive.
I am currently working on a series of patches that will enable SMMTT [1] support
in both OpenSBI and QEMU. SMMTT is a much more granular, table-based isolation
primitive which does not have the same alignment/sizing requirements as PMP.

This patch series lays some of the groundwork for landing SMMTT support in
OpenSBI. Perhaps the most significant change here is that memregions now keep
track of their raw sizes (rather than power-of-two rounded orders) throughout
most of their lifetime. Then, when OpenSBI is about to apply its isolation
configuration at the end of the coldboot/warmboot paths, the memregions for
each domain are "sanitized" according to isolation primitive-specific rules.

The first two patches in this series are optional to apply, although I've found
them useful when developing SMMTT. The first moves the memregion-related
functionality out of sbi_domain.c into a new sbi_memregion.c. The second renames
struct sbi_domain_memregion to struct sbi_memregion, while also renaming all of
the memregion permission macros similarly. This makes the code somewhat more
readable, especially since domain-handling and memregion-handling become more
decoupled throughout this patch series.

[1] https://github.com/riscv/riscv-smmtt

Gregor Haas (8):
  lib: sbi: Separate domain-handling code from memregion-handling code
  lib: sbi: Create sbi_domain_dump_memregions()
  lib: sbi: Rename domain_memregion -> memregion
  lib: sbi: memregion: Introduce memregion_start/end macros
  lib: sbi: memregion: Make memregions keep track of raw size rather
    than order
  lib: sbi: Do a merging pass on memregions whenever a domain is
    sanitized
  lib: sbi: Remove PMP assumptions from memregion
  lib: sbi: memregion: Move memregion_sanitize_pmp() closer to its call
    site

 docs/domain_support.md                   |  45 ++-
 include/sbi/sbi_domain.h                 | 192 +---------
 include/sbi/sbi_hart.h                   |   2 +-
 include/sbi/sbi_memregion.h              | 215 +++++++++++
 include/sbi/sbi_platform.h               |   2 +-
 lib/sbi/objects.mk                       |   1 +
 lib/sbi/sbi_domain.c                     | 444 +++-------------------
 lib/sbi/sbi_domain_context.c             |   2 +-
 lib/sbi/sbi_hart.c                       |  91 +++--
 lib/sbi/sbi_init.c                       |   6 +-
 lib/sbi/sbi_memregion.c                  | 459 +++++++++++++++++++++++
 lib/utils/fdt/fdt_domain.c               |  53 +--
 lib/utils/fdt/fdt_fixup.c                |  20 +-
 lib/utils/ipi/aclint_mswi.c              |  12 +-
 lib/utils/ipi/andes_plicsw.c             |   6 +-
 lib/utils/irqchip/aplic.c                |  12 +-
 lib/utils/irqchip/imsic.c                |  13 +-
 lib/utils/irqchip/plic.c                 |   4 +-
 lib/utils/regmap/fdt_regmap_syscon.c     |   4 +-
 lib/utils/serial/cadence-uart.c          |   4 +-
 lib/utils/serial/fdt_serial_htif.c       |   4 +-
 lib/utils/serial/uart8250.c              |   4 +-
 lib/utils/timer/aclint_mtimer.c          |  24 +-
 lib/utils/timer/andes_plmt.c             |   6 +-
 platform/generic/renesas/rzfive/rzfive.c |   2 +-
 platform/generic/sophgo/sg2042.c         |   6 +-
 26 files changed, 910 insertions(+), 723 deletions(-)
 create mode 100644 include/sbi/sbi_memregion.h
 create mode 100644 lib/sbi/sbi_memregion.c

-- 
2.45.2


