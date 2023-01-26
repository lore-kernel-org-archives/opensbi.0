From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Thu, 26 Jan 2023 09:58:29 +0000
Subject: [RFC PATCH v3 0/3] Renesas RZ/Five add support to configure PMA and add vendor specific SBI extension
Message-ID: <20230126095832.21566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 platform/generic/include/andes45-pma.h        |  48 +++
 platform/generic/renesas/rzfive/andes45-pma.c | 350 ++++++++++++++++++
 platform/generic/renesas/rzfive/objects.mk    |   1 +
 platform/generic/renesas/rzfive/rzfive.c      |  90 +++++
 5 files changed, 498 insertions(+)
 create mode 100644 platform/generic/include/andes45-pma.h
 create mode 100644 platform/generic/renesas/rzfive/andes45-pma.c

-- 
2.17.1


