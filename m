From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:23 -0700
Subject: [PATCH 00/10] Refactor generic platform overrides from middleware to helpers
Message-ID: <20250325234342.711447-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series refactors how overrides work in the generic platform. The
ultimate goal is to make platform override matching respect the priority
order of the root node compatible strings, as implemented for fdt_driver
in commit 0ffe265fd969 ("lib: utils/fdt: Respect compatible string
fallback priority"). But this series also makes the generic platform
code a bit more efficient, and shrinks the firmware by about a kilobyte.
The first three commits fix minor issues with the existing overrides.


Samuel Holland (10):
  platform: generic: andes: Remove inline definitions
  platform: rzfive: Call andes_pma_setup_regions() only during cold boot
  platform: generic: thead: Avoid casting away const
  platform: generic: Add an init hook matching fdt_driver
  platform: generic: Allow replacing platform operations
  platform: generic: Modify platform ops instead of using hooks
  platform: generic: Remove platform override hooks
  platform: generic: Initialize overrides with fdt_driver
  lib: utils/fdt: Remove fdt_match_node()
  lib: sbi_platform: Remove the vendor_ext_check hook

 include/sbi/sbi_platform.h                    |   7 +-
 include/sbi_utils/fdt/fdt_helper.h            |   3 -
 lib/utils/fdt/fdt_helper.c                    |  19 ---
 platform/generic/allwinner/sun20i-d1.c        |  53 ++++---
 platform/generic/andes/ae350.c                |  25 +++-
 platform/generic/andes/andes_pmu.c            |  13 +-
 platform/generic/andes/andes_sbi.c            |   3 +-
 platform/generic/include/andes/andes_pmu.h    |  23 +--
 platform/generic/include/andes/andes_sbi.h    |   4 +-
 platform/generic/include/platform_override.h  |  37 ++---
 platform/generic/platform.c                   | 138 +++---------------
 .../generic/platform_override_modules.carray  |   2 +-
 platform/generic/renesas/rzfive/rzfive.c      |  46 ++++--
 platform/generic/sifive/fu540.c               |  13 +-
 platform/generic/sifive/fu740.c               |  20 ++-
 platform/generic/sophgo/sg2042.c              |  31 +++-
 platform/generic/starfive/jh7110.c            |  26 ++--
 platform/generic/thead/thead-generic.c        |  38 +++--
 18 files changed, 220 insertions(+), 281 deletions(-)

-- 
2.47.2


