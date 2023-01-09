From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon,  9 Jan 2023 05:20:36 +0000
Subject: [PATCH v2 2/9] lib: sbi: Use finer permission semantics for address validation
In-Reply-To: <20230109052043.55473-1-hchauhan@ventanamicro.com>
References: <20230109052043.55473-1-hchauhan@ventanamicro.com>
Message-ID: <20230109052043.55473-3-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the fine grained permisssion semantics for address validation
of a given region.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_domain.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 19e2029..7663244 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -107,24 +107,33 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 {
 	bool rmmio, mmio = false;
 	struct sbi_domain_memregion *reg;
-	unsigned long rstart, rend, rflags, rwx = 0;
+	unsigned long rstart, rend, rflags, rwx = 0, rrwx = 0;
 
 	if (!dom)
 		return false;
 
+	/*
+	 * Use M_{R/W/X} bits because the SU-bits are at the
+	 * same relative offsets. If the mode is not M, the SU
+	 * bits will fall at same offsets after the shift.
+	 */
 	if (access_flags & SBI_DOMAIN_READ)
-		rwx |= SBI_DOMAIN_MEMREGION_READABLE;
+		rwx |= SBI_DOMAIN_MEMREGION_M_READABLE;
+
 	if (access_flags & SBI_DOMAIN_WRITE)
-		rwx |= SBI_DOMAIN_MEMREGION_WRITEABLE;
+		rwx |= SBI_DOMAIN_MEMREGION_M_WRITABLE;
+
 	if (access_flags & SBI_DOMAIN_EXECUTE)
-		rwx |= SBI_DOMAIN_MEMREGION_EXECUTABLE;
+		rwx |= SBI_DOMAIN_MEMREGION_M_EXECUTABLE;
+
 	if (access_flags & SBI_DOMAIN_MMIO)
 		mmio = true;
 
 	sbi_domain_for_each_memregion(dom, reg) {
 		rflags = reg->flags;
-		if (mode == PRV_M && !(rflags & SBI_DOMAIN_MEMREGION_MMODE))
-			continue;
+		rrwx = (mode == PRV_M ? (rflags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK)
+			: (rflags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
+			>> SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT);
 
 		rstart = reg->base;
 		rend = (reg->order < __riscv_xlen) ?
@@ -133,7 +142,7 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
 			if (mmio != rmmio)
 				return false;
-			return ((rflags & rwx) == rwx) ? true : false;
+			return ((rrwx & rwx) == rwx) ? true : false;
 		}
 	}
 
-- 
2.34.1


