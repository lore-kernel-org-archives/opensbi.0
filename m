From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 27 Sep 2023 18:08:31 +0800
Subject: [PATCH] lib: utils: timer/ipi: Update memregion flags for PLMT and PLICSW
Message-ID: <20230927100831.1119170-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds unspecified permission flags for the PLICSW region
and updates the permission of the PLMT region.

With this update, both regions will become M-mode only read/write
regions in the root domain.

  Domain0 Region00: 0x00000000f0300000-0x00000000f0300fff M: (I,R,W) S/U: (R,W)
  Domain0 Region01: 0x0000000000040000-0x000000000005ffff M: (R,W) S/U: ()
  Domain0 Region02: 0x0000000000000000-0x000000000003ffff M: (R,X) S/U: ()
> Domain0 Region03: 0x00000000e6000000-0x00000000e60fffff M: (I,R,W) S/U: ()
> Domain0 Region04: 0x00000000e6400000-0x00000000e67fffff M: (I,R,W) S/U: ()
  Domain0 Region05: 0x0000000000000000-0xffffffffffffffff M: () S/U: (R,W,X)

The PMP rules of AE350-AX65 (single-core) w/ Smepmp:

  p/x $pmpcfg0
  $1 = {0x1f9b9b9d9b1e00,
  pmp0cfg = {0x0},
                    L--AAXWR
  pmp1cfg = {0x1e} (00011110), pmpaddr1: 0xf0300000 ~   0xf0300fff  (UART1)
  pmp2cfg = {0x9b} (10011011), pmpaddr2:    0x40000 ~      0x5ffff
  pmp3cfg = {0x9d} (10011101), pmpaddr3:        0x0 ~      0x3ffff
  pmp4cfg = {0x9b} (10011011), pmpaddr4: 0xe6000000 ~   0xe60fffff  (PLMT)
  pmp5cfg = {0x9b} (10011011), pmpaddr5: 0xe6400000 ~   0xe67fffff  (PLICSW)
  pmp6cfg = {0x1f} (00011111), pmpaddr6:        0x0 ~ 0xffffffffff
  pmp7cfg = {0x0 }}

The PMP rules of AE350-AX45MP (qual-core) w/o Smepmp:

  p/x $pmpcfg0
  $1 = {0x1f181818181b,
                     L--AAXWR
  pmp0cfg = {0x1b}, (00011011), pmpaddr0: 0xf0300000 ~  0xf0300fff  (UART1)
  pmp1cfg = {0x18}, (00011000), pmpaddr1:    0x40000 ~     0x5ffff
  pmp2cfg = {0x18}, (00011000), pmpaddr2:        0x0 ~     0x3ffff
  pmp3cfg = {0x18}, (00011000), pmpaddr3: 0xe6000000 ~  0xe60fffff  (PLMT)
  pmp4cfg = {0x18}, (00011000), pmpaddr4: 0xe6400000 ~  0xe67fffff  (PLICSW)
  pmp5cfg = {0x1f}, (00011111), pmpaddr5:        0x0 ~ 0x1ffffffff
  pmp6cfg = {0x0 }}

Note that starting from this patch, we restrict the S/U-mode read
permission to the PLMT region, since we should read the TIME CSR
in a lower privilege mode.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
This patch is based on the fix [1] to UART8250

[1] https://patchwork.ozlabs.org/project/opensbi/patch/20230925122426.1667314-1-peterlin at andestech.com/
---
 lib/utils/ipi/andes_plicsw.c | 4 +++-
 lib/utils/timer/andes_plmt.c | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index dde39c0..5693efb 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -131,7 +131,9 @@ int plicsw_cold_ipi_init(struct plicsw_data *plicsw)
 	/* Add PLICSW region to the root domain */
 	rc = sbi_domain_root_add_memrange(plicsw->addr, plicsw->size,
 					  PLICSW_REGION_ALIGN,
-					  SBI_DOMAIN_MEMREGION_MMIO);
+					  SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_M_READABLE |
+					  SBI_DOMAIN_MEMREGION_M_WRITABLE);
 	if (rc)
 		return rc;
 
diff --git a/lib/utils/timer/andes_plmt.c b/lib/utils/timer/andes_plmt.c
index 94a86cc..6e4bfaf 100644
--- a/lib/utils/timer/andes_plmt.c
+++ b/lib/utils/timer/andes_plmt.c
@@ -81,8 +81,11 @@ int plmt_cold_timer_init(struct plmt_data *plmt)
 
 	/* Add PLMT region to the root domain */
 	rc = sbi_domain_root_add_memrange(
-		(unsigned long)plmt->time_val, plmt->size, PLMT_REGION_ALIGN,
-		SBI_DOMAIN_MEMREGION_MMIO | SBI_DOMAIN_MEMREGION_READABLE);
+		(unsigned long)plmt->time_val, plmt->size,
+		PLMT_REGION_ALIGN,
+		SBI_DOMAIN_MEMREGION_MMIO |
+		SBI_DOMAIN_MEMREGION_M_READABLE |
+		SBI_DOMAIN_MEMREGION_M_WRITABLE);
 	if (rc)
 		return rc;
 
-- 
2.34.1


