From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 20 Dec 2022 16:16:20 +0530
Subject: [PATCH 4/9] lib: sbi: Use finer permission sematics to decide on PMP bits
In-Reply-To: <20221220104625.80667-1-hchauhan@ventanamicro.com>
References: <20221220104625.80667-1-hchauhan@ventanamicro.com>
Message-ID: <20221220104625.80667-5-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the fine grained permission bits to decide if the region
permissions are to enforced on all modes. Also use the new
permission bits for deciding on R/W/X bits in pmpcfg register.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 5447c52..2ded55b 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -303,14 +303,20 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 			break;
 
 		pmp_flags = 0;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_READABLE)
+
+		/*
+		 * If permissions are to be enforced for all modes on this region,
+		 * the lock bit should be set.
+		 */
+		if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
+			pmp_flags |= PMP_L;
+
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
 			pmp_flags |= PMP_R;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_WRITEABLE)
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
 			pmp_flags |= PMP_W;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_EXECUTABLE)
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
 			pmp_flags |= PMP_X;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_MMODE)
-			pmp_flags |= PMP_L;
 
 		pmp_addr =  reg->base >> PMP_SHIFT;
 		if (pmp_gran_log2 <= reg->order && pmp_addr < pmp_addr_max)
-- 
2.39.0


