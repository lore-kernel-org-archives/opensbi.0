From: Xiang W <wxjstz@126.com>
Date: Wed, 19 Mar 2025 20:37:07 +0800
Subject: [PATCH] lib: sbi: sbi_mpxy_set_shmem adds parameter check
Message-ID: <20250319123719.504622-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Shared memory needs to be accessed in M-Mode, and the high address of
physical memory should be 0

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_mpxy.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index c5d9d1bb..7d4d26ab 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -287,6 +287,20 @@ int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
 	if (shmem_phys_lo & ~PAGE_MASK)
 		return SBI_ERR_INVALID_PARAM;
 
+	/*
+	* On RV32, the M-mode can only access the first 4GB of
+	* the physical address space because M-mode does not have
+	* MMU to access full 34-bit physical address space.
+	* So fail if the upper 32 bits of the physical address
+	* is non-zero on RV32.
+	*
+	* On RV64, kernel sets upper 64bit address part to zero.
+	* So fail if the upper 64bit of the physical address
+	* is non-zero on RV64.
+	*/
+	if (shmem_phys_hi)
+		return SBI_ERR_INVALID_PARAM;
+
 	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
 				SHMEM_PHYS_ADDR(shmem_phys_hi, shmem_phys_lo),
 				mpxy_shmem_size, PRV_S,
-- 
2.47.2


