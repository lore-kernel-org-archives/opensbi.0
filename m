From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu, 19 Jan 2023 20:48:26 +0530
Subject: [PATCH v3 5/5] Add two entries:
In-Reply-To: <20230119151826.59697-1-hchauhan@ventanamicro.com>
References: <20230119151826.59697-1-hchauhan@ventanamicro.com>
Message-ID: <20230119151826.59697-6-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  1. TEXT: fw_start to _fw_rw_offset with RX permissions
  2. DATA: _fw_rw_offset to fw_size with RW permissions

These permissions are still not enforced from M-mode but lay
the ground work for enforcing them for M-mode. SU-mode don't
have any access to these regions.

Sample output:
 Domain0 Region01  : 0x0000000080000000-0x000000008001ffff M: (R,X) S/U: ()
 Domain0 Region02  : 0x0000000080020000-0x000000008003ffff M: (R,W) S/U: ()

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 lib/sbi/sbi_domain.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 60fda01..9ddc1a7 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -638,12 +638,32 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	u32 i;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
+	if (scratch->fw_rw_offset != 0
+	    && (scratch->fw_rw_offset & (scratch->fw_rw_offset - 1)) != 0) {
+		sbi_printf("%s: fw_rw_offset not a power of 2 (0x%lx)\n",
+			   __func__, scratch->fw_rw_offset);
+		return SBI_EINVAL;
+	}
+
+	if ((scratch->fw_start & (scratch->fw_rw_offset - 1)) != 0) {
+		sbi_printf("%s: fw_start and fw_rw_offset not aligned\n",
+			   __func__);
+		return SBI_EINVAL;
+	}
+
 	/* Root domain firmware memory region */
-	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size,
-				  SBI_DOMAIN_MEMREGION_M_RWX,
+	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
+				  (SBI_DOMAIN_MEMREGION_M_READABLE |
+				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE),
 				  &root_fw_region);
 	domain_memregion_initfw(&root_memregs[root_memregs_count++]);
 
+	sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
+				  (scratch->fw_size - scratch->fw_rw_offset),
+				  (SBI_DOMAIN_MEMREGION_M_READABLE |
+				   SBI_DOMAIN_MEMREGION_M_WRITABLE),
+				  &root_memregs[root_memregs_count++]);
+
 	/* Root domain allow everything memory region */
 	sbi_domain_memregion_init(0, ~0UL,
 				  (SBI_DOMAIN_MEMREGION_READABLE |
-- 
2.39.1


