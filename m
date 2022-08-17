From: Heiko Stuebner <heiko@sntech.de>
Date: Wed, 17 Aug 2022 13:19:59 +0200
Subject: [PATCH v2 0/5] Add support for T-HEAD C9xx PMU extensions
Message-ID: <20220817112004.745776-1-heiko@sntech.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The T-HEAD C9XX cores implement functionality very similar to SSCOFPMF.
Instead of implementing a separate interface into SBI as done in v1,
we can add the C9XX tidbits with quite minimal overhead and leaverage
the existing SBI pmu interface including giving access to the firmware
counters.

The current only hickup is the detection override in sbi_hart, where
I still need to find out why the MHPMCOUNTERs are not writeable
at _that_ point of the boot, but with this series on top of openSBI 1.1
and the matching kernel perf patch I get reasonable results for example
for:

perf stat -e cycles -e instructions -e L1-icache-load-misses -e L1-icache-loads ls

 Performance counter stats for 'ls':

          17119496      cycles
           2867765      instructions              #    0.17  insn per cycle
             55929      L1-icache-load-misses     #    1.61% of all L1-icache accesses
           3467346      L1-icache-loads

       0.030156216 seconds time elapsed

       0.000000000 seconds user
       0.023496000 seconds sys

Heiko Stuebner (5):
  lib: sbi_platform: pass extension bitmap pointer to extension_init
  lib: sbi: do platform-specific extension population earlier
  platform: generic: add extensions_init handler and platform-override
  platform: generic: allwinner: add an extension for C9xx cores
  lib: sbi_pmu: add t-head pmu support

 include/sbi/riscv_thead_c9xx.h               | 127 +++++++++++++++++++
 include/sbi/sbi_hart.h                       |   3 +
 include/sbi/sbi_platform.h                   |   7 +-
 lib/sbi/sbi_hart.c                           |  29 ++++-
 lib/sbi/sbi_pmu.c                            |  48 ++++++-
 platform/generic/allwinner/sun20i-d1.c       |  10 ++
 platform/generic/include/platform_override.h |   2 +
 platform/generic/platform.c                  |   9 ++
 8 files changed, 226 insertions(+), 9 deletions(-)
 create mode 100644 include/sbi/riscv_thead_c9xx.h

-- 
2.35.1


