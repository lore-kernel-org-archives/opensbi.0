From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 10 Jul 2021 22:28:20 +0800
Subject: [PATCH 1/2] firmware: Remove the unhelpful alignment codes before fdt
 relocation
Message-ID: <20210710142821.4168-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the device tree is at an address that is not __SIZEOF_POINTER__
aligned, the fdt relocation code tries to align both source and
destination address to __SIZEOF_POINTER__ before the memory copy.
But such alignment can lead to unexpected results if either source
or destination address is not aligned.

In fact libfdt requires that the device tree must be at an 8-byte
aligned address. Hence remove the unhelpful alignment codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 firmware/fw_base.S | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 8e40562..abf21cd 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -349,8 +349,7 @@ _scratch_init:
 	 * previous booting stage.
 	 */
 	beqz	a1, _fdt_reloc_done
-	/* Mask values in a3 and a4 */
-	li	a3, ~(__SIZEOF_POINTER__ - 1)
+	/* Mask values in a4 */
 	li	a4, 0xff
 	/* t1 = destination FDT start address */
 	MOV_3R	s0, a0, s1, a1, s2, a2
@@ -359,10 +358,8 @@ _scratch_init:
 	MOV_3R	a0, s0, a1, s1, a2, s2
 	beqz	t1, _fdt_reloc_done
 	beq	t1, a1, _fdt_reloc_done
-	and	t1, t1, a3
 	/* t0 = source FDT start address */
 	add	t0, a1, zero
-	and	t0, t0, a3
 	/* t2 = source FDT size in big-endian */
 #if __riscv_xlen == 64
 	lwu	t2, 4(t0)
-- 
2.25.1


