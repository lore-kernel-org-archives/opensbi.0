From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Mon,  6 Feb 2023 00:06:21 +0000
Subject: [PATCH v4 0/3] Renesas RZ/Five add support to configure PMA and add vendor specific SBI extension
Message-ID: <20230206000624.6544-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

This patch series aims to add support to configure the PMA regions present
on the Andes AX45MP core (andes45-pma.c which can be shared with other
Andes vendors) and configures the required PMA region for RZ/Five SoC.

This patch series also adds the SBI vendor extension
RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND to check if IOCP is present on
the core and if un-available it also checks if SW workaround for cache
management needs to be applied.

RFC v3 -> RFC v4
-> Used bit field for flags in struct andes45_pma_region
-> Renamed andes45-pma.h -> andes45_pma.h
-> Included RB tag from Lin san for patch 2/3
-> Moved CSR to platform/generic/include/andes/andes45.h
-> Included sbi/sbi_error.h in andes45-pma.c to fix build issue

RFC v2 -> RFC v3
-> Fixed review comments pointed by Lin-san
   * Used switch case macro
   * Added a check to verify the PMA size is power-of-2
   * Dropped un-needed calculation done in PMA code for NAPOT.
   * Dropped MISA macro
-> Fixed comments pointed by Himanshu
-> Fixed check patch issue

RFC v2 -> RFC v1
-> Fixed review comments pointed by Lin-san
-> Implemented PMA as library so that it can be shared

RFC v1:
https://patchwork.ozlabs.org/project/opensbi/patch/20221212094421.14556-1-prabhakar.mahadev-lad.rj at bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  platform: generic: renesas: rzfive: Add support to configure the PMA
  platform: generic: renesas: rzfive: Configure the PMA region
  platform: generic: renesas: rzfive: Add SBI EXT to check for enabling
    IOCP errata

 platform/generic/Kconfig                      |   9 +
 platform/generic/include/andes/andes45.h      |  25 +-
 platform/generic/include/andes45_pma.h        |  48 +++
 platform/generic/renesas/rzfive/andes45-pma.c | 350 ++++++++++++++++++
 platform/generic/renesas/rzfive/objects.mk    |   1 +
 platform/generic/renesas/rzfive/rzfive.c      |  68 ++++
 6 files changed, 499 insertions(+), 2 deletions(-)
 create mode 100644 platform/generic/include/andes45_pma.h
 create mode 100644 platform/generic/renesas/rzfive/andes45-pma.c

-- 
2.17.1


