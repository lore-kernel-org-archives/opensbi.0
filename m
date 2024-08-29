From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 29 Aug 2024 13:13:52 -0700
Subject: [PATCH] firmware: Simplify FDT header endianness conversion
Message-ID: <20240829201403.3658798-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reduce the code size by using single-byte loads instead of bit
manipulation. This method also does the right thing on (hypothetical)
big-endian systems.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 firmware/fw_base.S | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index b950c0b8..0b58cc42 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -242,30 +242,14 @@ _scratch_init:
 	beq	t1, a1, _fdt_reloc_done
 	/* t0 = source FDT start address */
 	add	t0, a1, zero
-	/* t2 = source FDT size in big-endian */
-#if __riscv_xlen > 32
-	lwu	t2, 4(t0)
-#else
-	lw	t2, 4(t0)
-#endif
-	/* t3 = bit[15:8] of FDT size */
-	add	t3, t2, zero
-	srli	t3, t3, 16
-	and	t3, t3, a4
+	/* t2 = source FDT size (convert from big-endian) */
+	lbu	t2, 7(t0)
+	lbu	t3, 6(t0)
+	lbu	t4, 5(t0)
+	lbu	t5, 4(t0)
 	slli	t3, t3, 8
-	/* t4 = bit[23:16] of FDT size */
-	add	t4, t2, zero
-	srli	t4, t4, 8
-	and	t4, t4, a4
 	slli	t4, t4, 16
-	/* t5 = bit[31:24] of FDT size */
-	add	t5, t2, zero
-	and	t5, t5, a4
 	slli	t5, t5, 24
-	/* t2 = bit[7:0] of FDT size */
-	srli	t2, t2, 24
-	and	t2, t2, a4
-	/* t2 = FDT size in little-endian */
 	or	t2, t2, t3
 	or	t2, t2, t4
 	or	t2, t2, t5
-- 
2.45.1


