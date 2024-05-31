From: Ben Zong-You Xie <ben717@andestech.com>
Date: Fri, 31 May 2024 13:21:08 +0800
Subject: [PATCH] platform: generic: andes: Add support for RV32 to set up PMA
Message-ID: <20240531052108.3124699-1-ben717@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Like PMP, the behaviors to configure PMA will be different from
RV64 and RV32. RV64 uses two Andes custom CSRs, pmacfg0 and pmacfg2,
but RV32 uses four Andes custom CSRs, pmacfg0 ~ pmacfg3. This patch
adds support to PMA for RV32.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 platform/generic/andes/andes_pma.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
index 321074a..9c37720 100644
--- a/platform/generic/andes/andes_pma.c
+++ b/platform/generic/andes/andes_pma.c
@@ -109,10 +109,17 @@ static unsigned long andes_pma_setup(const struct andes_pma_region *pma_region,
 	    !(pma_region->flags & ANDES_PMACFG_ETYP_NAPOT))
 		return SBI_EINVAL;
 
+#if __riscv_xlen == 64
 	pma_cfg_addr = CSR_PMACFG0 + ((entry_id / 8) ? 2 : 0);
 	pmacfg_val = andes_pma_read_num(pma_cfg_addr);
 	pmaxcfg = (char *)&pmacfg_val + (entry_id % 8);
-	*pmaxcfg = 0;
+#elif __riscv_xlen == 32
+	pma_cfg_addr = CSR_PMACFG0 + (entry_id / 4);
+	pmacfg_val = andes_pma_read_num(pma_cfg_addr);
+	pmaxcfg = (char *)&pmacfg_val + (entry_id % 4);
+#else
+#error "Unexpected __riscv_xlen"
+#endif
 	*pmaxcfg = pma_region->flags;
 
 	andes_pma_write_num(pma_cfg_addr, pmacfg_val);
-- 
2.34.1


